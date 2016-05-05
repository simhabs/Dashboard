
var app = angular.module('myApp', [])
var ctrl = app.controller('Mycntrlr', function ($scope, $http) {

    $http.get('http://localhost:1476/api/alert/getalert').then(function (res, data) {
        $scope.Alerts = res.data;
    });
    $scope.save = function (Alerts) {

        var Alerts = {
            Id: -1,
            Date: Alerts.Date,
            Message: Alerts.Message,
            MessageTypeId: Alerts.MessageTypeId,
            StatusId: Alerts.StatusId,
            UserId:Alerts.UserId,
             Name:Alerts.Name



        }

        var req = {
            method: 'POST',
            url: 'http://localhost:1476/api/alert/savealerts',
            data: Alerts
        }
        $http(req).then(function (response) {
            alert('saved successfully.');

        });

    //    $scope.currRole = null;

    //};

    //$scope.setCurrRole = function (grp) {
    //    $scope.currRole = grp;
    //};

    //$scope.clearCurrRole = function () {
    //    $scope.currRole = null;

    }
});






