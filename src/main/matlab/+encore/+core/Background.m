classdef Background < encore.core.Signal
    
    properties
        value
        sampleRate
        sampleRateUnits
    end
    
    methods
        
        function obj = Background(cobj)
            obj@encore.core.Signal(cobj);
        end
        
        function v = get.value(obj)
            v = double(obj.cobj.getValue());
        end
        
        function r = get.sampleRate(obj)
            r = double(obj.cobj.getSampleRate());
        end
        
        function u = get.sampleRateUnits(obj)
            u = char(obj.cobj.getSampleRateUnits());
        end
        
    end
    
end

