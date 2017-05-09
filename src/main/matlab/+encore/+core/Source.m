classdef Source < encore.core.ResourceAnnotatableEntity
    
    properties
        label
        identifier
    end
    
    properties (SetAccess = private)
        experiment
        creationTime
        parent
    end
    
    methods
        
        function obj = Source(cobj)
            obj@encore.core.ResourceAnnotatableEntity(cobj);
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
        
        function t = get.creationTime(obj)
            t = obj.datetimeFromZonedDateTime(obj.cobj.getCreationTime());
        end
        
        function i = get.identifier(obj)
            i = char(obj.cobj.getIdentifier());
        end
        
        function set.identifier(obj, i)
            obj.cobj.setIdentifier(i);
        end
        
        function s = insertSource(obj, label, creationTime, identifier)
            ctime = obj.zonedDateTimeFromDatetime(creationTime);
            cs = obj.tryCoreWithReturn(@()obj.cobj.insertSource(label, ctime, identifier));
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

