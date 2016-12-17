var Alarm = function (startime, endtime, countFunc, endFunc) {
        this.time = Math.floor((endtime - startime) / 1000); //时间
        this.countFunc = countFunc; //计时函数
        this.endFunc = endFunc; //结束函数
        this.flag = 't' + Date.parse(new Date()); //
    };
Alarm.prototype.start = function () {
    var self = this;

    self.flag = setInterval(function () {
        if (self.time < 0) {
            clearInterval(self.flag);
            self.endFunc();
        } else {
            var minute, hour, day, second;
            day = Math.floor(self.time / 60 / 60 / 24) < 10 ? '0' + Math.floor(self.time / 60 / 60 / 24) : Math.floor(self.time / 60 / 60 / 24);
            hour = Math.floor(self.time / 60 / 60 % 24) < 10 ? '0' + Math.floor(self.time / 60 / 60 % 24) : Math.floor(self.time / 60 / 60 % 24);
            minute = Math.floor(self.time / 60 % 60) < 10 ? '0' + Math.floor(self.time / 60 % 60) : Math.floor(self.time / 60 % 60);
            second = Math.floor(self.time % 60) < 10 ? '0' + Math.floor(self.time % 60) : Math.floor(self.time % 60);
            //倒计时执行函数
            self.countFunc(second, minute, hour, day);
            self.time--;
        }
    }, 999);
}