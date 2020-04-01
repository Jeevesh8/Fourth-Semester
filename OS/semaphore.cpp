/*
compile as:-  g++ -pthread semaphore.cpp -o semaphore
Run     as:-  ./semaphore
*/

#include<semaphore.h>
#include<iostream>
#include<stdio.h>
#include<pthread.h>

using namespace std;

sem_t s;

void* child(void* arg)
{
    printf("child\n");
    sem_post(&s);
    return nullptr;
}

int main(){
    sem_init(&s, 0, 1);
    printf("Parent : begin\n");
    pthread_t c;
    pthread_create(&c, nullptr, child, nullptr);
    sem_wait(&s);
    printf("parent:end\n");
    return 0;
}

