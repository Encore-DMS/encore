classdef (Abstract) CoreObject < handle
    
    properties (SetAccess = private, Hidden)
        cobj
    end
    
    methods
        
        function tf = isequal(obj, other)
            if isempty(obj) || isempty(other) || ~isa(obj, 'encore.core.CoreObject') || ~isa(other, 'encore.core.CoreObject')
                tf = false;
                return;
            end
            tf = obj.cobj.equals(other.cobj);
        end
        
        function tf = eq(obj, other)
            if isempty(obj) || isempty(other) || ~isa(obj, 'encore.core.CoreObject') || ~isa(other, 'encore.core.CoreObject')
                tf = false;
                return;
            end
            tf = obj.cobj == other.cobj;
        end
        
        function tf = ne(obj, other)
            tf = ~eq(obj, other);
        end
        
    end
    
    methods (Access = protected)
        
        function obj = CoreObject(cobj)
            obj.cobj = cobj;
        end
        
        function tryCore(obj, call) %#ok<INUSL>
            try
                call();
            catch x
                if isa(x, 'matlab.exception.JavaException')
                    error(encore.core.util.javaReport(x));
                else
                    rethrow(x);
                end
            end
        end
        
        function r = tryCoreWithReturn(obj, call) %#ok<INUSL>
            try
                r = call();
            catch x
                if isa(x, 'matlab.exception.JavaException')
                    error(encore.core.util.javaReport(x));
                else
                    rethrow(x);
                end
            end
        end
        
        function c = cellArrayFromStream(obj, stream, wrap) %#ok<INUSL>
            if nargin < 3 || isempty(wrap)
                wrap = @(e)e;
            end
            
            c = {};
            iter = stream.iterator();
            i = 1;
            while iter.hasNext()
                c{i} = wrap(iter.next()); %#ok<AGROW>
                i = i + 1;
            end
        end
        
        function t = datetimeFromZonedDateTime(obj, zdt) %#ok<INUSL>
            second = double(zdt.getSecond()) + (double(zdt.getNano()) / 10^9);
            t = datetime(zdt.getYear(), zdt.getMonthValue(), zdt.getDayOfMonth(), zdt.getHour(), zdt.getMinute(), second);
            tz = char(zdt.getZone().toString());
            t.TimeZone = tz;
        end
        
        function zdt = zonedDateTimeFromDatetime(obj, t) %#ok<INUSL>
            if isempty(t.TimeZone)
                error('Datetime ''TimeZone'' must be set');
            end
            t.Format = 'ZZZZZ';
            zone = java.time.ZoneId.of(char(t));
            zdt = java.time.ZonedDateTime.of(t.Year, t.Month, t.Day, t.Hour, t.Minute, floor(t.Second), round(10^9*rem(t.Second, 1)), zone);
        end
        
    end
    
end

