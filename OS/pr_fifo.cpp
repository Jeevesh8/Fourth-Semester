#include<iostream>
#include<queue>
#include "page.h"

#define page_table_size 12

using namespace std;

queue q;
page* get_page()
{
    if(q.size()>=page_table_size)
        q.pop();
    page* p = get_page();
    q.push(p);
    
}

