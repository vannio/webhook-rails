App.cable.subscriptions.create('EmailChannel', {
  received: function(data){
    if (data.message == 'update_counts') this.updateTables();
  },

  updateTables: function(){
    $('#tableData').load('/emails table');
  }
});
