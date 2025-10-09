if exists(select name from sys.databases where name='learn_connection_nodejs')
begin drop database learn_connection_nodejs
print 'Database learn_connection_nodejs droped'
end
else
begin create database learn_connection_nodejs;
print 'Database learn_connection_nodejs created'
end