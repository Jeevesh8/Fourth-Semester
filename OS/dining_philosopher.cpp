#include<semaphore.h>
#include<pthread.h>
#define N_FORKS 5

sem_t forks[N_FORKS];

int left(int pos) {return pos;}
int right(int pos)  { return (pos+1)%5; }

void get_forks(int phil)
{
    if(phil==N_FORKS-1)
    {
        sem_wait(&forks[right(p)]);
        sem_wait(&forks[left(p)]);
    }
    else
    {
        sem_wait(&forks[left(p)]);
        sem_wait(&forks[right(p)]);
    }
}

void put_forks(int phil)
{
    sem_post(&forks[right(phil)]);
    sem_post(&forks[left(phil)]);
}

void philosopher()
{
    think();
    get_forks();
    eat();
    put_forks();
}
                
void main()
{
    for(int i=0; i<N_FORKS; ++i)
        sem_init(&forks[i], 0, 1);
    for(int i=0;i<N_PHIL-1; ++i)
    {
        pthread_t phil_thread;
        pthread_create(&phil_thread, nullptr, philosopher, nullptr);
    }    
}