classdef Source < encore.core.AnnotatableEntity
    
    properties
        label
    end
    
    properties (SetAccess = private)
        experiment
        parent
    end
    
    methods
        
        function obj = Source(cobj)
            obj@encore.core.AnnotatableEntity(cobj);
        end
        
        function e = get.experiment(obj)
            e = encore.core.Experiment(obj.cobj.getExperiment());
        end
        
        function p = get.parent(obj)
            p = encore.core.Source(obj.cobj.getParent());
        end
        
        function l = get.label(obj)
            l = char(obj.cobj.getLabel());
        end
        
        function set.label(obj, l)
            obj.cobj.setLabel(l);
        end
        
        function s = insertSource(obj, label)
            cs = obj.tryCoreWithReturn(@()obj.cobj.insertSource(label));
            s = encore.core.Source(cs);
        end
        
        function s = getChildren(obj)
            cs = obj.tryCoreWithReturn(@()obj.cobj.getChildren());
            s = obj.cellArrayFromStream(cs, @encore.core.Source);
        end
        
        function t = getEntityType(obj) %#ok<MANU>
            t = encore.core.EntityType.SOURCE;
        end
        
    end
    
end

