classdef EpochBlock < encore.core.TimelineEntity
    
    properties (SetAccess = private)
        epochGroup
        protocolId
    end
    
    methods
        
        function obj = EpochBlock(cobj)
            obj@encore.core.TimelineEntity(cobj);
        end
        
        function s = get.epochGroup(obj)
            s = encore.core.EpochGroup(obj.cobj.getEpochGroup());
        end
        
        function p = get.protocolId(obj)
            p = char(obj.cobj.getProtocolId());
        end
        
        function e = insertEpoch(obj, protocolParameters, startTime, endTime)
            if nargin < 4
                cendTime = [];
            else
                cendTime = obj.zonedDateTimeFromDatetime(endTime);
            end
            cprotocolParameters = [];
            cstartTime = obj.zonedDateTimeFromDatetime(startTime);
            ce = obj.tryCoreWithReturn(@()obj.cobj.insertEpoch(cprotocolParameters, cstartTime, cendTime));
            e = encore.core.Epoch(ce);
        end
        
        function e = getEpochs(obj)
            ce = obj.tryCoreWithReturn(@()obj.cobj.getEpochs());
            e = obj.cellArrayFromStream(ce, @encore.core.Epoch);
        end
        
        function t = getEntityType(obj) %#ok<MANU>
            t = encore.core.EntityType.EPOCH_BLOCK;
        end
        
    end
    
end

