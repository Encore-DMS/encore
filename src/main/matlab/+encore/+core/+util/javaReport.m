function r = javaReport(javaException)
    x = javaException.ExceptionObject;
    while ~isempty(x.getCause())
        x = x.getCause();
    end
    r = char(x.getMessage());
end

