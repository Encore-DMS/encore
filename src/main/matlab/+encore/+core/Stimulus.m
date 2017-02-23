classdef Stimulus < encore.core.Signal
    
    properties (SetAccess = private)
        stimulusId
    end
    
    methods
        
        function obj = Stimulus(cobj)
            obj@encore.core.Signal(cobj);
        end
        
        function i = get.stimulusId(obj)
            i = char(obj.cobj.getStimulusId());
        end
        
    end
    
end

