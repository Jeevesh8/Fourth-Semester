#include<iostream>
#include<vector>
#include "page.h"

#define page_table_size 12

using namespace std;

vector<pair<page,int>> v;

page* get_page(page* p)
{
    if(p not in tlb)
    {
        if(v.size()>page_table_size)
        {
            int max=0;
            int max_index=0;
            for(size_t i=0;i<v.size();++i)
            {
                if(v[i]>max)
                { 
                    max=v[i];
                    ma_index=i;
                }
            }
        v[max_index] = make_pair(allocate_page(),-1);
        }
        else
        {
            v.push_back(make_pair(allocate_page(),-1));
        }
        
        
    }
    p->counter=-1;
    for(size_t i=0;i<v.size();++i)
    {
        v[i].second++;
    }
}