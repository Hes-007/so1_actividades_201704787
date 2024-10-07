#include <stdio.h>
#include <pthread.h>
#include <unistd.h>
#include <sys/types.h>

void* thread_function(void* arg) {
    printf("Hilo creado en el proceso (PID:)\n");
    pthread_exit(NULL);
}

int main() {
    pid_t pid;
    pthread_t thread;

    pid = fork();  // Primer fork
    if (pid == 0) {  // Código del proceso hijo
        printf("Proceso hijo (PID:, PPID:)\n");

        fork();  // Segundo fork dentro del proceso hijo

        // Crear un hilo en el proceso hijo
        pthread_create(&thread, NULL, thread_function, NULL);
        pthread_join(thread, NULL);  // Esperar a que el hilo termine
    }

    fork();  
    printf("Proceso con PID %d\n", getpid());
    sleep(1);

    return 0;
}
