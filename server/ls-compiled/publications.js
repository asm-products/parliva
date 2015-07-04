// Generated by LiveScript 1.3.1
Meteor.publish('portraits', function(){
  return Portraits.find();
});
Meteor.publish('users', function(){
  return Meteor.users.find({}, {
    fields: {
      "emails": 1,
      "profile": 1,
      "username": 1
    }
  });
});
Meteor.publish('consultors', function(){
  return Meteor.users.find({
    'profile.isConsultor': true,
    'profile.ratePerSession': {
      $gt: 0
    }
  }, {
    fields: {
      "emails": 1,
      "profile": 1,
      "username": 1
    }
  });
});
Meteor.publish('chat_messages', function(userId){
  return Messages.find({
    roomUserIds: {
      $all: [this.userId, userId]
    }
  });
});
Meteor.publish('messages', function(){
  return Messages.find({
    senderId: {
      $ne: this.userId
    }
  }, {
    sort: {
      date: -1
    }
  });
});
Meteor.publish('chat_partners', function(userId){
  return Meteor.users.find({
    _id: userId
  }, {
    fields: {
      "emails": 1,
      "profile": 1,
      "username": 1
    }
  });
});
Meteor.publish('chat', function(contactId, limit){
  if (contactId) {
    return Messages.find({
      userIds: {
        $all: [this.userId, contactId]
      }
    }, {
      limit: limit
    });
  }
});