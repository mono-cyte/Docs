TRUNCATE index_归经;
insert into index_归经 (id, target_id)
SELECT source.id,
       归经.id
FROM source
         join _int ON _int.i <= LENGTH(source.归经) - LENGTH(REPLACE(source.归经, ',', '')) + 1
         left join 归经 on 归经.name = SUBSTRING_INDEX(SUBSTRING_INDEX(source.归经, ',', _int.i), ',', -1);


TRUNCATE index_味;
insert into index_味 (id, target_id)
SELECT source.id,
       味.id
FROM source
         join _int ON _int.i <= LENGTH(source.味) - LENGTH(REPLACE(source.味, ',', '')) + 1
         left join 味 on 味.name = SUBSTRING_INDEX(SUBSTRING_INDEX(source.味, ',', _int.i), ',', -1);


TRUNCATE tcm_index;
insert into tcm_index (id, name, 分类, 性, 趋向, 功效, feature, 对证, 描述, weight)
SELECT source.id,
       source.name,
       分类.id,
       性.id,
       趋向.id,
       功效,
       feature,
       对证,
       描述,
       weight.id
FROM source
left join weight on weight.name = source.weight
left join 分类 on 分类.name = source.分类
left join 性 on 性.name = source.性
left join 趋向 on 趋向.name = source.趋向


