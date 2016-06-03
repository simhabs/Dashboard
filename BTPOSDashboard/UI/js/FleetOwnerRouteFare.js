﻿var app = angular.module('myApp', ['ngStorage']);


app.directive('ngOnFinishRender', function ($timeout) {
    return {
        restrict: 'A',
        link: function (scope, element, attr) {
            if (scope.$last === true) {
                $timeout(function () {
                    scope.$emit(attr.broadcastEventName ? attr.broadcastEventName : 'ngRepeatFinished');
                });
            }
        }
    };
});

var ctrl = app.controller('mycntrlr', function ($scope, $http, $localStorage, $filter) {
    $scope.uname = $localStorage.uname;



    $scope.checkedArr = new Array();
    $scope.uncheckedArr = new Array();
    $scope.FORoutes = [];

    $scope.GetCompanies = function () {

        var vc = {
            needCompanyName: '1'
        };

        var req = {
            method: 'POST',
            url: 'http://localhost:1476/api/VehicleConfig/VConfig',
            //headers: {
            //    'Content-Type': undefined
            data: vc
        }
        $http(req).then(function (res) {
            $scope.initdata = res.data;
        });

    }

    $scope.GetFleetOwners = function () {
        if ($scope.cmp == null) {
            $scope.FleetOwners = null;
            return;
        }
        var vc = {
            needfleetowners: '1',
            cmpId: $scope.cmp.Id
        };

        var req = {
            method: 'POST',
            url: 'http://localhost:1476/api/VehicleConfig/VConfig',
            //headers: {
            //    'Content-Type': undefined

            data: vc


        }
        $http(req).then(function (res) {
            $scope.cmpdata = res.data;
        });
    }

    $scope.getFleetOwnerRoute = function () {

        if ($scope.s == null) {
            $scope.FORoutes = null;          
            return;
        }

        $http.get('http://localhost:1476/api/FleetOwnerRoute/getFleetOwnerRoute?cmpId=' + $scope.cmp.Id + '&fleetownerId=' + $scope.s.Id).then(function (res, data) {
            $scope.FORoutes = res.data;
          
        });
    }

    $scope.getFOFleetforRoute = function () {       

            var selCmp = $scope.cmp;

            if (selCmp == null) {
                $scope.fleet = null;
                return;
            }
            var cmpId = (selCmp == null) ? -1 : selCmp.Id;

            var fr = {
                cmpId: selCmp.Id,
                routeid: $scope.r.RouteId,
                fleetownerId: $scope.s.Id
            };

            var req = {
                method: 'POST',
                url: 'http://localhost:1476/api/FleetRoutes/getFleetRoutesList',
                //headers: {
                //    'Content-Type': undefined
                data: fr
            }
            $http(req).then(function (res) {
                $scope.fleet = res.data;
            });
        
    }

    $scope.getVehicleFareConfig = function () {

        if ($scope.v == null) {
            $scope.FOVFareConfig = null;           
            return;
        }

        $http.get('http://localhost:1476/api/FleetOwnerRouteFare/GetFOVehicleFareConfig?vehicleId=' + $scope.v.VehicleId).then(function (res, data) {
            $scope.FOVFareConfig = res.data;

        });

    }

    $scope.saveFORoutes = function () {

        //from the checked and unchecked array get the actuallly records to be saved
        //from checked array take the records which have assigned = 0 as there are new assignements
        //from unchecked array take assgined = 1 as these need to be removed


        var FleetOwnerRoutes = [];

        for (var cnt = 0; cnt < $scope.checkedArr.length; cnt++) {

            if ($scope.checkedArr[cnt].assigned == 0) {
                var fr = {
                    Id: -1,
                    FleetOwnerId: $scope.s.Id,
                    CompanyId: $scope.cmp.Id,
                    RouteId: $scope.checkedArr[cnt].RouteId,
                    From: $scope.checkedArr[cnt].FromDate,
                    To: $scope.checkedArr[cnt].ToDate,
                    Active: 1,
                    insupddelflag: 'I'
                }

                FleetOwnerRoutes.push(fr);
            }
        }

        for (var cnt = 0; cnt < $scope.uncheckedArr.length; cnt++) {

            if ($scope.uncheckedArr[cnt].assigned == 1) {
                var fr = {
                    Id: -1,
                    FleetOwnerId: $scope.s.Id,
                    CompanyId: $scope.cmp.Id,
                    RouteId: $scope.uncheckedArr[cnt].RouteId,
                    From: $scope.uncheckedArr[cnt].FromDate,
                    To: $scope.uncheckedArr[cnt].ToDate,
                    Active: 1,
                    insupddelflag: 'D'
                }

                FleetOwnerRoutes.push(fr);
            }
        }

        $http({
            url: 'http://localhost:1476/api/FleetOwnerRoute/saveFleetOwnerRoute',
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            data: FleetOwnerRoutes,

        }).success(function (data, status, headers, config) {
            alert('Fleet owner routes successfully');
            $scope.getFleetOwnerRoute();
        }).error(function (ata, status, headers, config) {
            alert(ata);
        });
    };


    $scope.toggle = function (item) {
        var idx = $scope.checkedArr.indexOf(item);
        if (idx > -1) {
            $scope.checkedArr.splice(idx, 1);
        }
        else {
            $scope.checkedArr.push(item);
        }

        var idx = $scope.uncheckedArr.indexOf(item);
        if (idx > -1) {
            $scope.uncheckedArr.splice(idx, 1);
        }
        else {
            $scope.uncheckedArr.push(item);
        }
    };


    $scope.toggleAll = function () {
        if ($scope.checkedArr.length === $scope.FORoutes.length) {
            $scope.uncheckedArr = $scope.checkedArr.slice(0);
            $scope.checkedArr = [];

        } else if ($scope.checkedArr.length === 0 || $scope.FORoutes.length > 0) {
            $scope.checkedArr = $scope.FORoutes.slice(0);
            $scope.uncheckedArr = [];
        }

    };

    $scope.exists = function (item, list) {
        return list.indexOf(item) > -1;
    };


    $scope.isChecked = function () {
        return $scope.checkedArr.length === $scope.FORoutes.length;
    };

    $scope.$on('ngRepeatFinished', function () {
        $("input[id*='date']").datepicker({
            dateFormat: "dd/mm/yy"
        });
    });

});