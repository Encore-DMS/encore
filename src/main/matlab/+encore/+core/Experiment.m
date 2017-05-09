classdef Experiment < encore.core.TimelineEntity
    
    properties
        purpose
    end
    
    methods
        
        function obj = Experiment(cobj)
            obj@encore.core.TimelineEntity(cobj);
        end
        
        function addProject(obj, project)
            obj.tryCore(@()obj.cobj.addProject(project.cobj));
        end
        
        function p = getProjects(obj)
            cp = obj.tryCoreWithReturn(@()obj.cobj.getProjects());
            p = obj.cellArrayFromStream(cp, @encore.core.Project);
        end
        
        function p = get.purpose(obj)
            p = char(obj.cobj.getPurpose());
        end
        
        function set.purpose(obj, p)
            obj.cobj.setPurpose(p);
        end
        
        function s = insertSource(obj, label, creationTime, identifier)
            ctime = obj.zonedDateTimeFromDatetime(creationTime);
            cs = obj.tryCoreWithReturn(@()obj.cobj.insertSource(label, ctime, identifier));
            s = encore.core.Source(cs);
        end
        
        function s = getSources(obj)
            cs = obj.tryCoreWithReturn(@()obj.cobj.getSources());
            s = obj.cellArrayFromStream(cs, @encore.core.Source);
        end
        
        function s = getAllSourcesWithIdentifier(obj, identifier)
            cs = obj.tryCoreWithReturn(@()obj.cobj.getAllSourcesWithIdentifier(identifier));
            s = obj.cellArrayFromStream(cs, @encore.core.Source);
        end
        
        function d = insertDevice(obj, name, manufacturer)
            cd = obj.tryCoreWithReturn(@()obj.cobj.insertDevice(name, manufacturer));
            d = encore.core.Device(cd);
        end
        
        function d = getDevices(obj)
            cd = obj.tryCoreWithReturn(@()obj.cobj.getDevices());
            d = obj.cellArrayFromStream(cd, @encore.core.Device);
        end
        
        function d = getDevice(obj, name, manufacturer)
            cd = obj.tryCoreWithReturn(@()obj.cobj.getDevice(name, manufacturer));
            if ~isempty(cd)
                d = encore.core.Device(cd);
            else
                d = [];
            end
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
        
        function g = getEpochGroups(obj)
            cg = obj.tryCoreWithReturn(@()obj.cobj.getEpochGroups());
            g = obj.cellArrayFromStream(cg, @encore.core.EpochGroup);
        end
        
        function t = getEntityType(obj) %#ok<MANU>
            t = encore.core.EntityType.EXPERIMENT;
        end
        
    end
    
end

