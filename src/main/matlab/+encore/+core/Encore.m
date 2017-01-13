classdef Encore < encore.core.CoreObject
    
    methods (Static)
        
        function c = connect(url, user, password)
            cdsc = io.github.encore_dms.Encore.connect(url, user, password);
            c = encore.core.DataStoreCoordinator(cdsc);
        end
        
    end
    
end

