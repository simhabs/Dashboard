// JavaScript source code
// JavaScript source code
var app = angular.module('myApp', ['ngStorage', 'ui.bootstrap']);
var ctrl = app.controller('myCtrl', function ($scope, $http, $localStorage) {
    if ($localStorage.uname == null) {
        window.location.href = "login.html";
    }
    $scope.uname = $localStorage.uname;
    $scope.userdetails = $localStorage.userdetails;
    $scope.Roleid = $scope.userdetails[0].roleid;

    $scope.dashboardDS = $localStorage.dashboardDS;

    $scope.GetSubCategories = function () {

        $http.get('http://localhost:1476/api/SubCategory/getsubcategory?catid=6').then(function (response, req) {
            $scope.SubCategory = response.data;
        });
    }

    $scope.GetInventoryItems = function () {

        $http.get('http://localhost:1476/api/InventoryItem/GetInventoryItem').then(function (response, req) {
            $scope.InventoryItems = response.data;
            $scope.getselectval();

        });
    }

      $scope.getselectval = function (seltype) {
        var grpid = (seltype) ? seltype.Id : -1;
    //to save new inventory item
        $http.get('http://localhost:1476/api/Inventory/getsubcategory?subcatid=1' + grpid).then(function (res, data) {
            $scope.Item = res.data;
        });
      }
      $scope.getselectval = function (seltype) {
          var grpid = (seltype) ? seltype.Id : -1;
          //to save new inventory item
          $http.get('http://localhost:1476/api/Inventory/getsubcategory?catid=6' + grpid).then(function (res, data) {
              $scope.Item = res.data;
          });
      }


      $scope.saveNewItem = function (Item) {
          if (Item == null) {
              alert('Please enter ItemName.');
              return;
          }

          if (Item.ItemName == null) {
              alert('Please enter ItemName.');
              return;
          }

          var Item = {
              Id: -1,
              ItemName: Item.ItemName,
              ItemImage: Item.ItemImage,
              Code: Item.Code,
              Description: Item.Description,
              Category: 6,// Item.Category.Id,
              SubCategory: Item.SubCategory.Id,
              ReOrderPoint: Item.ReOrderPoint
          }

          var req = {
              method: 'POST',
              url: 'http://localhost:1476/api/InventoryItem/SaveInventoryItem',
              data: Item
          }
          $http(req).then(function (response) {

              $scope.showDialog("Saved successfully!");

              $scope.Group = null;

          }, function (errres) {
              var errdata = errres.data;
              var errmssg = "";
              errmssg = (errdata && errdata.ExceptionMessage) ? errdata.ExceptionMessage : errdata.Message;
              $scope.showDialog(errmssg);
          });
          $scope.currGroup = null;
      };

        $scope.save = function (Item) {

            var Item = {
                Id: Item.Id,
                ItemName: Item.ItemName,
                ItemImage: Item.ItemImage,
                Code: Item.Code,
                Description: Item.Description,
                Category: Item.Category,
                SubCategory: Item.SubCategory,
                ReOrderPoint: Item.ReOrderPoint
            }

            var req = {
                method: 'POST',
                url: 'http://localhost:1476/api/InventoryItem/SaveInventoryItem',
                data: Item
            }
            $http(req).then(function (response) {

                $scope.showDialog("Saved successfully!");

                $scope.Group = null;

            }, function (errres) {
                var errdata = errres.data;
                var errmssg = "";
                errmssg = (errdata && errdata.ExceptionMessage) ? errdata.ExceptionMessage : errdata.Message;
                $scope.showDialog(errmssg);
            });
          $scope.currGroup = null;
      };
      $scope.Items1 = null;


    $scope.setItem = function (item) {
        $scope.CurrItem = item;        
    };

    $scope.clearItems1 = function () {
        $scope.Items1 = null;
    }


    $scope.showDialog = function (message) {

        var modalInstance = $uibModal.open({
            animation: $scope.animationsEnabled,
            templateUrl: 'myModalContent.html',
            controller: 'ModalInstanceCtrl',
            resolve: {
                mssg: function () {
                    return message;
                }
            }
        });
    }

});

    app.controller('ModalInstanceCtrl', function ($scope, $uibModalInstance, mssg) {

        $scope.mssg = mssg;
        $scope.ok = function () {
            $uibModalInstance.close('test');
        };

        $scope.cancel = function () {
            $uibModalInstance.dismiss('cancel');
        };
});