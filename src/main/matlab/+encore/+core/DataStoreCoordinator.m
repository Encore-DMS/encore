classdef DataStoreCoordinator < encore.core.CoreObject
    
    methods
        
        function obj = DataStoreCoordinator(cobj)
            obj@encore.core.CoreObject(cobj);
        end
        
        function c = getContext(obj)
            cctx = obj.tryCoreWithReturn(@()obj.cobj.getContext());
            c = encore.core.DataContext(cctx);
        end
        
    end
    
end

