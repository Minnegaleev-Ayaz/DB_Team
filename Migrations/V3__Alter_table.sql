ALTER TABLE City
ADD COLUMN rayons_count int CHECK ( rayons_count>0 and rayons_count<50 )