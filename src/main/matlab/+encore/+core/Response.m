classdef Response < encore.core.Signal
    
    properties (SetAccess = private)
        sampleRate
        sampleRateUnits
    end
    
    methods
        
        function obj = Response(cobj)
            obj@encore.core.Signal(cobj);
        end
        
        function d = getData(obj)
            d = [];
        end
        
        function r = get.sampleRate(obj)
            r = obj.cobj.getSampleRate();
        end
        
        function u = get.sampleRateUnits(obj)
            u = char(obj.cobj.getSampleRateUnits());
        end
        
    end
    
end

