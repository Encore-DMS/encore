classdef DataContext < encore.core.CoreObject
    
    methods
        
        function obj = DataContext(cobj)
            obj@encore.core.CoreObject(cobj);
        end
        
        function p = insertProject(obj, name, purpose, startTime, endTime)
            if nargin < 5
                cendTime = [];
            else
                cendTime = obj.zonedDateTimeFromDatetime(endTime);
            end
            cstartTime = obj.zonedDateTimeFromDatetime(startTime);            
            cprj = obj.tryCoreWithReturn(@()obj.cobj.insertProject(name, purpose, cstartTime, cendTime));
            p = encore.core.Project(cprj);
        end
        
        function p = getProjects(obj)
            cp = obj.tryCoreWithReturn(@()obj.cobj.getProjects());
            p = obj.cellArrayFromStream(cp, @encore.core.Project);
        end
        
    end
    
end

