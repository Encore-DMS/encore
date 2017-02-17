classdef EpochGroup < encore.core.TimelineEntity
    
    properties
        label
    end
    
    properties (SetAccess = private)
        experiment
        parent
        source
    end
    
    methods
        
        function obj = EpochGroup(cobj)
            obj@encore.core.TimelineEntity(cobj);
        end
        
        function e = get.experiment(obj)
            e = encore.core.Experiment(obj.cobj.getExperiment());
        end
        
        function p = get.parent(obj)
            p = encore.core.EpochGroup(obj.cobj.getParent());
        end
        
        function s = get.source(obj)
            s = encore.core.Source(obj.cobj.getSource());
        end
        
        function l = get.label(obj)
            l = char(obj.cobj.getLabel());
        end
        
        function set.label(obj, l)
            obj.cobj.setLabel(l);
        end
        
        function g = insertEpochGroup(obj, source, label, startTime, endTime)
            if nargin < 5
                cendTime = [];
            else
                cendTime = obj.zonedDateTimeFromDatetime(endTime);
            end
            cstartTime = obj.zonedDateTimeFromDatetime(startTime);
            cg = obj.tryCoreWithReturn(@()obj.cobj.insertEpochGroup(source.cobj, label, cstartTime, cendTime));
            g = encore.core.EpochGroup(cg);
        end
        
        function g = getChildren(obj)
            cg = obj.tryCoreWithReturn(@()obj.cobj.getChildren());
            g = obj.cellArrayFromStream(cg, @encore.core.EpochGroup);
        end
        
        function b = insertEpochBlock(obj, protocolId, parameters, startTime, endTime)
            if nargin < 5
                cendTime = [];
            else
                cendTime = obj.zonedDateTimeFromDatetime(endTime);
            end
            cstartTime = obj.zonedDateTimeFromDatetime(startTime);
            cparameters = [];
            cb = obj.tryCoreWithReturn(@()obj.cobj.insertEpochBlock(protocolId, cparameters, cstartTime, cendTime));
            b = encore.core.EpochBlock(cb);
        end
        
        function t = getEntityType(obj) %#ok<MANU>
            t = encore.core.EntityType.EPOCH_GROUP;
        end
        
    end
    
end

