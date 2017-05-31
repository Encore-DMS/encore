classdef AnnotatableEntity < encore.core.Entity
    
    properties (SetAccess = private)
        owner
    end
    
    methods
        
        function obj = AnnotatableEntity(cobj)
            obj@encore.core.Entity(cobj);
        end
        
        function o = get.owner(obj)
            o = encore.core.User(obj.cobj.getOwner());
        end
        
        function addProperty(obj, key, value)
            obj.tryCore(@()obj.cobj.addProperty(key, obj.propertyValueFromValue(value)));
        end
        
        function removeProperty(obj, key)
            obj.tryCore(@()obj.cobj.removeProperty(key));
        end
        
        function m = getProperties(obj)
            wrapValue = @(v)obj.mapFromJavaMap(v, @obj.valueFromPropertyValue);
            m = obj.mapFromJavaMap(obj.cobj.getProperties(), wrapValue, @(k)encore.core.User(k).username);
        end
        
        function m = getProperty(obj, key)
            m = obj.mapFromJavaMap(obj.cobj.getProperty(key), @obj.valueFromPropertyValue, @(k)encore.core.User(k).username);
        end
        
        function v = getUserProperty(obj, user, key)
            v = obj.valueFromPropertyValue(obj.cobj.getUserProperty(user.cobj, key));
        end
        
        function m = getUserProperties(obj, user)
            m = obj.mapFromJavaMap(obj.cobj.getUserProperties(user.cobj), @obj.valueFromPropertyValue);
        end
        
        function addKeyword(obj, keyword)
            obj.tryCore(@()obj.cobj.addKeyword(keyword));
        end
        
        function removeKeyword(obj, keyword)
            obj.tryCore(@()obj.cobj.removeKeyword(keyword));
        end
        
        function m = getKeywords(obj)
            mm = obj.cobj.getKeywords();
            m = obj.mapFromJavaMap(mm.asMap(), @(v)cell(v.toArray())', @(k)encore.core.User(k).username);
        end
        
        function k = getAllKeywords(obj)
            k = obj.cellArrayFromStream(obj.cobj.getAllKeywords(), @char);
        end
        
        function k = getUserKeywords(obj, user)
            k = obj.cellArrayFromStream(obj.cobj.getUserKeywords(user.cobj), @char);
        end
        
        function n = addNote(obj, text, time)
            if nargin < 3
                time = datetime('now', 'TimeZone', 'local');
            end
            ctime = obj.zonedDateTimeFromDatetime(time);
            cn = obj.tryCoreWithReturn(@()obj.cobj.addNote(ctime, text));
            n = encore.core.Note(cn);
        end
        
        function removeNote(obj, note)
            obj.tryCore(@()obj.cobj.removeNote(note.cobj));
        end
        
        function m = getNotes(obj)
            mm = obj.cobj.getNotes();
            wrapValue = @(v)cellfun(@encore.core.Note, cell(v.toArray()), 'UniformOutput', false)';
            m = obj.mapFromJavaMap(mm.asMap(), wrapValue, @(k)encore.core.User(k).username);
        end
        
        function n = getAllNotes(obj)
            n = obj.cellArrayFromStream(obj.cobj.getAllNotes(), @encore.core.Note);
        end
        
        function n = getUserNotes(obj, user)
            n = obj.cellArrayFromStream(obj.cobj.getUserNotes(user.cobj), @encore.core.Note);
        end
        
    end
    
end

