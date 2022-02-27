// add this at the end
[] spawn {
    while{true} do
    {
        private _rawTimeData = "extDB3" callExtension "9:LOCAL_TIME";
        private _timeData = call compile (_rawTimeData) select 1;
        private _day = _timeData select 2;
        private _month = _timeData select 1;
        private _year = _timeData select 0;
        private _minute = _timeData select 4;
        private _hour = _timeData select 3;

        if(_day < 10) then {_day = format ["0%1",_day]};
        if(_month < 10) then {_month = format ["0%1",_month]};
        if(_minute < 10) then {_minute = format ["0%1",_minute]};
        if(_hour < 10) then {_hour = format ["0%1",_hour]};

        private _date = format ["%1.%2.%3", _day, _month, _year];
        private _time = format ["%1:%2", _hour, _minute];

        dg_time       = _time;
        dg_serverTime = format["%1 %2", _date, _time];

        publicVariable "dg_time"; // watch for battleye filters
        publicVariable "dg_serverTime"; // watch for battleye filters
        sleep 59;
    };
};