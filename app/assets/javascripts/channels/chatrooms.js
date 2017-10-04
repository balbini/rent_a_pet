//= require cable
//= require_self
//= require_tree .

// This file is where we will define the client-side instance of our WebSocket connection.
// If there’s no current object, ‘this’ refers to the global object. In a web browser, that’s ‘window’ — the top-level object which represents the document, location, history and a few other useful properties and methods.
// https://www.sitepoint.com/what-is-this-in-javascript/
// .App is referring to this app directly
this.App = {};

App.cable = ActionCable.createConsumer("/cable");
