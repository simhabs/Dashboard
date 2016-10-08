﻿var app = angular.module('myApp', ['ngStorage'])
var ctrl = app.controller('myCtrl', function ($scope, $http, $localStorage) {
    if ($localStorage.uname == null) {
        window.location.href = "login.html";
    }
    $scope.uname = $localStorage.uname;
    $scope.userdetails = $localStorage.userdetails;
    $scope.Roleid = $scope.userdetails[0].roleid;

    $scope.dashboardDS = $localStorage.dashboardDS;

    $scope.GetEditHistory = function () {
        $http.get('/api/EditHistory/GetEditHistory').then(function (res, data) {
            $scope.Edit = res.data;
        })
    }

    $scope.setEditHistroyId = function (L) {
        $http.get('/api/EditHistoryDetails/GetEditHistoryDetails?edithistoryid=' + L.Id).then(function (res, data) {
            $scope.details = res.data;
        })
    }
});
