// Generated by LiveScript 1.3.1
angular.module('parliva').factory('plCategories', function(){
  var categories;
  categories = [
    {
      key: 'health',
      label: "Health"
    }, {
      key: 'software',
      label: "Software"
    }, {
      key: 'other',
      label: "Other"
    }
  ];
  return {
    get: function(){
      return categories;
    }
  };
});