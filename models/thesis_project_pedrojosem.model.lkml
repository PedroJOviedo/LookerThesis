connection: "thelook"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard


# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: thesis_project_pedrojosem_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}


# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
 explore: order_items {
   join: orders {
     relationship: many_to_one
     sql_on: ${orders.id} = ${order_items.order_id} ;;
   }

   join: users {
    type: left_outer
    relationship: many_to_one
     sql_on: ${users.id} = ${orders.user_id} ;;
   }

}
