var motion = require('ti.coremotion'),
	stepCounter = motion.createStepCounter();

Ti.UI.setBackgroundColor('#000');

var win1 = Titanium.UI.createWindow({  
    title:'Tab 1',
    backgroundColor:'#fff',
    layout:'vertical'
});


stepCounter.addEventListener('change',function(d){
	Ti.API.info("Step Changed " + JSON.stringify(d));
	alert(JSON.stringify(d));
});
stepCounter.addEventListener('started',function(d){
	alert("Started");
});
stepCounter.addEventListener('error',function(d){
	alert("error " + JSON.stringify(d));
});

stepCounter.addEventListener('stopped',function(d){
	alert("Stopped");
});

var btnStart = Ti.UI.createButton({
	top:40, left:25, right:25, height:60, title:'Start'
});

btnStart.addEventListener('click',function(e){
	if(!stepCounter.isSupported()){
		alert('Step Counter is not supported on this device');
	}else{
		stepCounter.start({
			triggerOn:3
		});		
	}
});
win1.add(btnStart);

var btnQuery = Ti.UI.createButton({
	top:40, left:25, right:25, height:60, title:'Query'
});

btnQuery.addEventListener('click',function(e){
	function onComplete(d){
		alert(JSON.stringify(d));
	}
	//Five days ago
	var from = new Date(new Date().setDate(new Date().getDate()-5)).getTime();
	var to = new Date().getTime();
	
	stepCounter.query({
		from:from,
		to:to,
		completed:onComplete
	});
});
win1.add(btnQuery);

var btnStop = Ti.UI.createButton({
	top:40, left:25, right:25, height:60, title:'Stop'
});

btnStop.addEventListener('click',function(e){
	stepCounter.stop();
});
win1.add(btnStop);

win1.open();
