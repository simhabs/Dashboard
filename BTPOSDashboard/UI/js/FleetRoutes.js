// JavaScript source code
var app = angular.module('myApp', ['ngStorage'])
var ctrl = app.controller('myCtrl', function ($scope, $http, $localStorage) {
    $scope.initdata= $localStorage.initdata


    $scope.GetFleeBTPosDetails = function () {

        $http.get('http://localhost:1476/api/FleetBtpos/GetFleebtDetails?foId=-1&cmpid=-1&initdata.newfleet.fdid=-1').then(function (res, data) {
            $scope.FleetBtposList = res.data;
        });
    }
   

    $scope.GetCompanies = function () {

        var vc = {
            needCompanyName: '1',
            needRoutes: '1',
            needRegNo:'1',
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

    $scope.GetFleetForFO = function () {

        $scope.vehicles = null;

        var fleetowner = $scope.s;

        if (fleetowner == null) {
            return;
        }

      
        var vc = {
            needvehicleRegno: '1',
            fleetownerId: fleetowner.Id
        };

        var req = {
            method: 'POST',
            url: 'http://localhost:1476/api/VehicleConfig/VConfig',
            //headers: {
            //    'Content-Type': undefined
            data: vc
        }
        $http(req).then(function (res) {
            $scope.vehicles = res.data;
        });
        $scope.GetFleetRoutes();
    }

    $scope.GetFleetRoutes = function () {      

        var selCmp = $scope.cmp;

        if (selCmp == null) {
            $scope.FleetRoute = null;          
            return;
        }
        var cmpId = (selCmp == null) ? -1 : selCmp.Id;

        var fr = {
            cmpId: selCmp.Id,
            routeid: '-1',
            fleetownerId: $scope.s.Id,
            regno: '-1'
        };

        var req = {
            method: 'POST',
            url: 'http://localhost:1476/api/FleetRoutes/getFleetRoutesList',
            //headers: {
            //    'Content-Type': undefined
            data: fr
        }
        $http(req).then(function (res) {
            $scope.FleetRoute = res.data;
        });
    }

//    $scope.GetFleetRouteInit = function () {
//        if ($scope.initdata.newfleet.fd == null) {
//            $scope.route = null;
//            return;
//        }
//        var vc = {
//            needroute: '1',
//            initdata.newfleet.fdId: $scope.initdata.newfleet.fd.Id
//    };
//    var req = {
//        method: 'POST',
//        url: 'http://localhost:1476/api/VehicleConfig/VConfig',
//        //headers: {
//        //    'Content-Type': undefined

//        data: vc


//    }
//    $http(req).then(function (res) {
//        $scope.FleetOwners = res.data;          
//    });
//}
   $scope.GetFleetRouteInit = function () {
       $http.get('http://localhost:1476/api/FleetRoutes/GetFleetRoutesList').then(function (res, data) {
            $scope.FleetRouteinit = res.data.Table;
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
            $scope.FleetOwners = res.data;          
        });
    }

    $scope.save = function (FleetRoute) {
        if(FleetRoute == null || FleetRoutes.VehicleId == null){
            alert('Please select a type VehicleId');
            return;
        }
        if(FleetRoute == null || FleetRoutes.RouteId == null){
            alert('Please select a type  RouteId ');
            return;
        }
     
        var FleetRoute = {
            Id: FleetRoutes.Id,
            VehicleId: FleetRoutes.VehicleId,
            RouteId: FleetRoutes.RouteId,
            EffectiveFrom: FleetRoutes.EffectiveFrom,
            EffectiveTill: FleetRoutes.EffectiveTill,
            Active: FleetRoutes.Active,

        };

        var req = {
            method: 'POST',
            url: 'http://localhost:1476/api/FleetRoutes/NewFleetRoutes',
            //headers: {
            //    'Content-Type': undefined

            data: FleetRoute


        }
        $http(req).then(function (res) { });


    }

    $scope.saveNewFleetRoutes = function (initdata) {
              
        var newFR = initdata.newfleet;

        if (newFR == null || newFR.v == null) {
            alert('Please select VehicleRegNo.');
            return;
        }

        if (newFR.v.Id == null) {
            alert('Please select Vehicle.');
            return;
        }

        if (newFR.r.ID == null) {
            alert('Please select route.');
            return;
        }

        var FleetRouters = {
            Id:-1 ,
            VehicleId: newFR.v.Id,          
            RouteId: newFR.r.ID,
            EffectiveFrom: newFR.EffectiveFrom,
            EffectiveTill: newFR.EffectiveTill,
            insupddelflag:'I'            
        };

        var req = {
            method: 'POST',
            url: 'http://localhost:1476/api/FleetRoutes/NewFleetRoutes',
            //headers: {
            //    'Content-Type': undefined

            data: FleetRouters
        }

        $http(req).then(function (res) {
            alert('Sucessfully saved!');
        });


    }
});





