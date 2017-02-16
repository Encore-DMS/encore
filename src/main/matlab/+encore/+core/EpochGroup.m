classdef EpochGroup < encore.core.TimelineEntity
    
    properties
        label
    end
    
    properties (SetAccess = private)
        experiment
        source
    end
    
    methods
        
        function obj = EpochGroup(cobj)
            obj@encore.core.TimelineEntity(cobj);
        end
        
        function l = get.label(obj)
            l = char(obj.cobj.getLabel());
        end
        
        function set.label(obj, l)
            obj.cobj.setLabel(l);
        end
        
        function e = get.experiment(obj)
            e = encore.core.Experiment(obj.cobj.getExperiment());
        end
        
        function s = get.source(obj)
            s = encore.core.Source(obj.cobj.getSource());
        end
        
        function t = getEntityType(obj) %#ok<MANU>
            t = encore.core.EntityType.EPOCH_GROUP;
        end
        
    end
    
end

