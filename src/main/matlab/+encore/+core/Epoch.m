classdef Epoch < encore.core.TimelineEntity
    
    properties (SetAccess = private)
        epochBlock
        protocolParameters
    end
    
    methods
        
        function obj = Epoch(cobj)
            obj@encore.core.TimelineEntity(cobj);
            obj.protocolParameters = containers.Map();
        end
        
        function b = get.epochBlock(obj)
            b = encore.core.EpochBlock(obj.cobj.getEpochBlock());
        end
        
        function r = insertResponse(obj, device, deviceParameters, data, units, sampleRate, sampleRateUnits)
            cdeviceParameters = [];
            cdata = [];
            cr = obj.tryCoreWithReturn(@()obj.cobj.insertResponse(device.cobj, cdeviceParameters, cdata, units, sampleRate, sampleRateUnits));
            r = encore.core.Response(cr);
        end
        
        function r = getResponses(obj)
            cr = obj.tryCoreWithReturn(@()obj.cobj.getResponses());
            r = obj.cellArrayFromStream(cr, @encore.core.Response);
        end
        
        function s = insertStimulus(obj, device, deviceParameters, stimulusId, parameters, units, data)
            cdeviceParameters = [];
            cparameters = [];
            cdata = [];
            cs = obj.tryCoreWithReturn(@()obj.cobj.insertStimulus(device.cobj, cdeviceParameters, stimulusId, cparameters, units, cdata));
            s = encore.core.Stimulus(cs);
        end
        
        function s = getStimuli(obj)
            cs = obj.tryCoreWithReturn(@()obj.cobj.getStimuli());
            s = obj.cellArrayFromStream(cs, @encore.core.Stimulus);
        end
        
        function b = insertBackground(obj, device, deviceParameters, value, units, sampleRate, sampleRateUnits)
            cdeviceParameters = [];
            cb = obj.tryCoreWithReturn(@()obj.cobj.insertBackground(device.cobj, cdeviceParameters, value, units, sampleRate, sampleRateUnits));
            b = encore.core.Background(cb);
        end
        
        function t = getEntityType(obj) %#ok<MANU>
            t = encore.core.EntityType.EPOCH;
        end
        
    end
    
end

