select
   extract( day from snap_interval) *24*60+
   extract( hour from snap_interval) *60+
   extract( minute from snap_interval ) "Snapshot Interval",
   extract( day from retention) *24*60+
   extract( hour from retention) *60+
   extract( minute from retention ) "Retention Interval",
   a.*
from
   dba_hist_wr_control a
where dbid = (select dbid from v$database);
   

exec dbms_workload_repository.create_snapshot;

exec dbms_workload_repository.modify_snapshot_settings(interval => 15, retention => 89280)