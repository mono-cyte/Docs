TRUNCATE result;
insert into result (id, name, 分类, 味, 性, 趋向, 归经, 功效, feature, 对证, 描述, weight)
select tcm_index.id                     as id,
       tcm_index.name                   as name,
       分类.name                        as 分类,
       group_concat(distinct 味.name)   as 味,
       性.name                          as 性,
       趋向.name                        as 趋向,
       group_concat(distinct 归经.name) as 归经,
       tcm_index.功效,
       tcm_index.feature,
       tcm_index.对证,
       tcm_index.描述,
       weight.name                      as weight
from tcm.tcm_index
         left join index_味 on tcm_index.id = index_味.id
         left join index_归经 on tcm_index.id = index_归经.id
         left join 味 on index_味.target_id = 味.id
         left join 归经 on index_归经.target_id = 归经.id
         left join 性 on tcm_index.性 = 性.id
         left join 分类 on tcm_index.分类 = 分类.id
         left join 趋向 on tcm_index.趋向 = 趋向.id
         left join weight on tcm_index.weight = weight.id
group by tcm_index.id;