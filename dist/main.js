var CONFIG,Detective,EventEmitter,Human,MessageFormat,Seer,Stranger,Villager,Wolves,duration,fs,os,repeat,stop,time,translate,utils,wait,_ref,_ref1,__hasProp={}.hasOwnProperty,__extends=function(a,b){function c(){this.constructor=a}for(var d in b)__hasProp.call(b,d)&&(a[d]=b[d]);return c.prototype=b.prototype,a.prototype=new c,a.__super__=b.prototype,a},__indexOf=[].indexOf||function(a){for(var b=0,c=this.length;c>b;b++)if(b in this&&this[b]===a)return b;return-1};require("better-require")("json yaml"),fs=require("fs"),os=require("os"),EventEmitter=require("events").EventEmitter,MessageFormat=require("grunt-locales/node_modules/messageformat"),CONFIG=require("../config/config.yml"),CONFIG.IRC=require("../config/irc.yml"),Wolves={Village:{}},Number.prototype.plural=function(a,b){return null==b&&(b=""),(1===this.valueOf()?a:b).replace(/%d/g,this.valueOf())},utils={duration:function(a,b){var c,d,e,f;return null==a&&(a="1s"),null==b&&(b=0),f={s:1,m:60,h:3600},d=RegExp(""+Object.keys(f)),c="(\\d+)(["+d+"])",e=a.match(RegExp(""+c,"gi")),e.forEach(function(a){var d,e,g;return g=a.match(RegExp(""+c)).slice(1),e=g[0],d=g[1],b+=f[d]*e}),1e3*b},time:function(a){var b,c,d,e,f;return f=a.match(/(\d+)([\.\:](\d+))?(am|pm)/),e=f[0],c=f[1],e=f[2],d=f[3],b=f[4],"pm"===b&&(c=12+ +c),d||(d=0),[+c,+d]},wait:function(a,b,c){return setTimeout(b.bind(c),a)},repeat:function(a,b,c){return setInterval(b.bind(c),a)},cancel:function(a){return clearTimeout(a)},stop:function(a){return clearInterval(a)},translations:function(a){var b,c;return b=require("./locales/"+a+"/i18n.json"),c=new MessageFormat(a,this.localePlurals[a]),function(a,d){var e,f;return null==d&&(d={}),(e=c.compile((null!=(f=b[a])?f.value:void 0)||a))(d)}},localePlurals:{en:function(a){return 1===a?"one":"other"},tr:function(a){return 1===a?"one":"other"}}},time=utils.time,duration=utils.duration,wait=utils.wait,repeat=utils.repeat,stop=utils.stop,Wolves.World=function(a){function b(){this.on("start",function(a){return function(){var b,c,d,e;return a.started?void console.log("World is already started"):(e=a.day.breaks.night,c=e[0],d=e[1],a.currentTime=a.generateTime(c,d),b=1e3*a.day.length/144e4,time=repeat(b,a.minute,a),a.started=!0)}}(this)),this.on("finish",function(a){return function(){return a.started?(stop(time),a.started=!1):void console.log("There is no world, start first")}}(this))}return __extends(b,a),b.prototype.day={length:duration("10s"),breaks:{morning:time("6am"),evening:time("7pm"),night:time("1am")}},b.prototype.event=function(a,b){return this.emit("fact",b)},b.prototype.setCurrentTime=function(a,b){return this.currentTime.setHours(a),this.currentTime.setMinutes(b)},b.prototype.minute=function(){var a,b,c,d,e,f,g;g=this.day.breaks;for(f in g)__hasProp.call(g,f)&&(e=g[f],a=this.generateTime.apply(this,e),c=a.getHours(),d=a.getMinutes(),b=this.currentTime.getDay()+1,c===this.currentTime.getHours()&&d===this.currentTime.getMinutes()&&this.emit(f,c,d,b));return this.currentTime.setTime(this.currentTime.getTime()+6e4)},b.prototype.generateTime=function(a,b){return new Date(1970,1,1,a,b,0)},b.prototype.start=function(){return this.emit("start")},b.prototype.end=function(){return this.emit("finish")},b}(EventEmitter),Wolves.Human=function(a){function b(){return b.__super__.constructor.apply(this,arguments)}return __extends(b,a),b.prototype.username="",b.prototype.requests=function(){return this.emit.apply(this,arguments)},b.prototype.listens=function(){return this.on.apply(this,arguments)},b}(EventEmitter),Human=Wolves.Human,Wolves.Stranger=function(a){function b(){}return __extends(b,a),b.prototype.username="",b.prototype.isAdmin=!1,b.prototype.isOwner=!1,b.prototype.isActive=!1,b.prototype.ableTo=function(a,b){var c;return c=b.at,__indexOf.call(this.can(c),a)>=0},b.prototype.join=function(){return this.requests("join")},b.prototype.start=function(){return this.requests("start")},b}(Human),Stranger=Wolves.Stranger,Wolves.Village.Villager=function(a){function b(){return b.__super__.constructor.apply(this,arguments)}return __extends(b,a),b.prototype.can=function(a,b){return null==b&&(b=[]),b.concat(function(){switch(!0){case"day"===a:return["vote","retract","goat"]}}())},b.prototype.seenAs=function(){return"villager"},b.prototype.coin=function(){return Math.random()>.5?"heads":"tails"},b.prototype.goats=function(a){return this.requests("goat",{to:a})},b.prototype.votes=function(a){return this.requests("vote",{to:a})},b.prototype.retracts=function(a){return this.requests("retract",{from:a})},b.prototype.reports=function(){return this.requests("votes")},b.prototype.role=function(){return this.requests("role")},b.prototype.leaves=function(){return this.requests("leave")},b}(Stranger),Villager=Wolves.Village.Villager,translate=utils.translate,Wolves.Village.Angel=function(a){function b(){return b.__super__.constructor.apply(this,arguments)}return __extends(b,a),b.population=function(a){switch(!0){case __indexOf.call([17,18,19,20],a)>=0:return 1}},b.prototype.can=function(a){return b.__super__.can.call(this,a,"night"===a?["protect"]:void 0)},b.prototype.protect=function(a){return this.announce("protect",a)},b.prototype.messages=function(a){switch(a){case"dead by wolf":return translate("Killed by {count, plural, one{wolf} other{wolves}}",{name:this.username,count:2});case"dead by people":return translate("{name}, the angel is killed by the people",{name:this.username})}},b}(Villager),Villager=Wolves.Village.Villager,Wolves.Village.Crow=function(a){function b(){return b.__super__.constructor.apply(this,arguments)}return __extends(b,a),b.population=function(a){switch(!0){case __indexOf.call([12,13,14,15,16,17,18,19,20],a)>=0:return 1}},b.prototype.can=function(a){return b.__super__.can.call(this,a,"night"===a?["kill","observe"]:void 0)},b.prototype.kill=function(a){return this.announce("kill",a)},b.prototype.observe=function(a){return this.announce("observe",a)},b}(Villager),_ref=Wolves.Village,Seer=_ref.Seer,Detective=_ref.Detective,Villager=_ref.Villager,Wolves.Village.Cursed=function(a){function b(){return b.__super__.constructor.apply(this,arguments)}return __extends(b,a),b.population=function(a){switch(!0){case __indexOf.call([4,5,6,7,8,9,10,11,12,13,14,15,16,17],a)>=0:return 1;case __indexOf.call([18,19,20],a)>=0:return 2}},b.prototype.seenAs=function(a){switch(!0){case a instanceof Seer:return"wolf";case a instanceof Detective:return"cursed";default:return b.__super__.seenAs.apply(this,arguments)}},b}(Villager),Villager=Wolves.Village.Villager,Wolves.Village.Detective=function(a){function b(){return b.__super__.constructor.apply(this,arguments)}return __extends(b,a),b.population=function(a){switch(!0){case __indexOf.call([12,13,14,15,16,17,18,19,20],a)>=0:return 1}},b.prototype.can=function(a){return b.__super__.can.call(this,a,"day"===a?["id"]:void 0)},b.prototype.id=function(a){return this.announce("id",a)},b}(Villager),Villager=Wolves.Village.Villager,Wolves.Village.Drunk=function(a){function b(){return b.__super__.constructor.apply(this,arguments)}return __extends(b,a),b.population=function(a){switch(!0){case __indexOf.call([8,9,10,11,12,13,14,15,16,17,18,19,20],a)>=0:return 1}},b}(Villager),Villager=Wolves.Village.Villager,Wolves.Village.Gunner=function(a){function b(){return b.__super__.constructor.apply(this,arguments)}return __extends(b,a),b.population=function(a){switch(!0){case __indexOf.call([10,11,12,13,14,15,16,17,18,19,20],a)>=0:return 1}},b.prototype.can=function(a){return b.__super__.can.call(this,a,"night"===a?["shoot"]:void 0)},b.prototype.shoot=function(){},b}(Villager),Villager=Wolves.Village.Villager,Wolves.Village.Harlot=function(a){function b(){return b.__super__.constructor.apply(this,arguments)}return __extends(b,a),b.population=function(a){switch(!0){case __indexOf.call([8,9,10,11,12,13,14,15,16,17,18,19,20],a)>=0:return 1}},b.prototype.can=function(a){return b.__super__.can.call(this,a,"night"===a?["visit"]:void 0)},b.prototype.visit=function(){},b}(Villager),Villager=Wolves.Village.Villager,Wolves.Village.Seer=function(a){function b(){return b.__super__.constructor.apply(this,arguments)}return __extends(b,a),b.population=function(a){switch(!0){case __indexOf.call([4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20],a)>=0:return 1}},b.prototype.can=function(a){return b.__super__.can.call(this,a,"night"===a?["see"]:void 0)},b.prototype.see=function(){},b}(Villager),_ref1=Wolves.Village,Seer=_ref1.Seer,Detective=_ref1.Detective,Villager=_ref1.Villager,Wolves.Village.Traitor=function(a){function b(){return b.__super__.constructor.apply(this,arguments)}return __extends(b,a),b.population=function(a){switch(!0){case __indexOf.call([8,9,10,11,12,13,14,15,16,17,18,19,20],a)>=0:return 1}},b.prototype.seenAs=function(a){switch(!0){case a instanceof Seer:return"villager";case a instanceof Detective:return"traitor"}},b}(Villager),Villager=Wolves.Village.Villager,Wolves.Village.Wolf=function(a){function b(){return b.__super__.constructor.apply(this,arguments)}return __extends(b,a),b.population=function(a){switch(!0){case __indexOf.call([4,5,6,7,8,9,10],a)>=0:return 1;case __indexOf.call([11,12,13],a)>=0:return 2;case __indexOf.call([14,15,16,17,18,19],a)>=0:return 3;case 20===a:return 4}},b.prototype.can=function(a){return b.__super__.can.call(this,a,"night"===a?["kill"]:void 0)},b.prototype.seenAs=function(){return"wolf"},b.prototype.kill=function(){},b}(Villager),Wolves.Village.ExampleRole=function(a){function b(){return b.__super__.constructor.apply(this,arguments)}return __extends(b,a),b.prototype.can=function(a){return b.__super__.can.call(this,a,"night"===a?["doSomething"]:void 0)},b.prototype.doSomething=function(){},b}(Villager),Villager=Wolves.Village.Villager,Wolves.Square=function(){function a(){}return a.prototype.villagers=[],a.prototype.addVillager=function(a){return this.villagers.push(a)},a.prototype.createVillagers=function(a){return null==a&&(a=[]),this.villagers.map(function(){return new Villager(player)})},a.prototype.generateVillagers=function(){return console.log(Village)},a}(),module.exports=Wolves;