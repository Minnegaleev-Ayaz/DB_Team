ALTER TABLE City
ADD COLUMN rayons_count int CHECK ( rayons_count>0 and rayons_count<50 );
ALTER TABLE Fan
ADD COLUMN height integer check(height>140 and height<250),
ADD COLUMN weight integer check(weight>40 and weight<200);

ALTER TABLE Coach
DROP COLUMN age,
ADD COLUMN birth_date date NOT NULL CHECK(birth_date < current_date);

