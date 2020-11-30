// create app
var app = {};
app.state = {};

// populate state
app.state.dirs = [];
app.state.nDirs = 0;
app.state.endDir = {
  tabN: 1,
  path: "Empty",
  subDirs: [],
  files: []
};


// add methods
// count directories
app.countDirs = function(){
  app.state.nDirs = app.state.dirs.filter(e => e.path != "Empty").length;
}

// add new directory
app.addTab = function(oTab){
  app.state.dirs = app.state.dirs.filter(e => e.path != "Empty");
  app.state.dirs.push(oTab);
  app.state.dirs.push(app.state.endDir);

  // renumber
  for(let i = 0; i < app.state.dirs.length; i++){
    app.state.dirs[i].tabN = i + 1;
  }
  app.countDirs();
}

// remove directory (by number)
app.removeTab = function(n){
  app.state.dirs = app.state.dirs.filter(e => e.tabN != n);
  
  // renumber
  for(let i = 0; i < app.state.dirs.length; i++){
    app.state.dirs[i].tabN = i + 1;
  }
  app.countDirs();
}

// update directory
app.updateTab = function(iTab, oTab){
  app.state.dirs[iTab - 1] = oTab;

  // renumber
  for(let i = 0; i < app.state.dirs.length; i++){
    app.state.dirs[i].tabN = i + 1;
  }
  app.countDirs();
}

// init app
app.init = function(appDiv){
  app.state.div = appDiv;
  
  // populate state with default
  app.state.dirs = [];
  app.state.dirs.push(app.state.endDir);
  app.countDirs();
}