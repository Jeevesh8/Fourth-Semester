/*
Banker's Algorithm
Assumptions :- 
1.) Atomic Processes(Once they start running , they run to completion)
2.) KNOWNS :- 
    a.)Initial allocation to all the processes [n_processes X n_type_resources]
    b.)Max availability of each resource       [n_type_processes]
    c.)Max need to execute the atomic process  [n_processes X n_type_processes]
3.) OUTPUTS :- 
    a.)IF deadlock occurs, outputs "DEADLOCK"
    b.)ELSE prints sequence in which the scheduled atomic processes can be executed.
*/

#include<vector>
#include<iostream>
using namespace std;

template<typename T>
void bankers_algo(vector<T> system_specs, vector<vector<T>> initial_allotment, vector<vector<T>> max_needs)
{
    vector<vector<T>> availability;
    for(unsigned i=0; i<system_specs.size(); ++i)
    {
        for(unsigned j=0; j<initial_allotment.size(); ++j)
        {
            availability[i] = system_specs[i] - initial_allotment[j][i];
        }
    }
    
    vector<vector<T>> remaining_needs;
    for(unsigned process=0; process<initial_allotment.size(); ++process)
    {
        for(unsigned resource=0; resource<initial_allotment[process].size(); ++resource)
        {
            remaining_needs[process][resource] = max_needs[process][resource] - initial_allotment[process][resource];
        }
    }

    vector<int> seq;    
    while(true)
    {
        bool deadlock = true;
        
        for(unsigned process=0; process<remaining_needs.size(); ++process)
        {
            bool satisfiable = true;
            
            for(unsigned resource=0; resource<remaining_needs[process].size(); ++resource)
            {
                if (remaining_needs[process][resource] > availability[resource])
                {
                    satisfiable = false;
                    break;
                }
            }
            
            if(satisfiable)
            {
                for(unsigned resource=0; resource<availability.size(); ++resource)
                {
                    availability[resource]+=initial_allotment[process][resource];
                }
                remaining_needs.erase(process);
                initial_allotment.erase(process);
                seq.push_back(process);
                process--;
                deadlock = false;
            }    
        }

        if(remaining_needs.size()==0)
        {
            for(auto x : seq)   cout<<x<<"->";
            break;
        }
        else if(deadlock)
        {
            cout<<"DEADLOCKED";
            break;
        }
    }
}