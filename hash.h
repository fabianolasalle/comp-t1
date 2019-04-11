#ifndef AIRCRAFT_H
#define AIRCRAFT_H
#include <stdlib.h>
#include <stdio.h>
#include <limits.h>
#include <string.h>

struct entry_s {
	char *key;
	int *token;
	struct entry_s *next;
};

typedef struct entry_s entry_t;

struct hashtable_s {
	int size;
	struct entry_s **table;	
};

typedef struct hashtable_s hashtable_t;

extern hashtable_t *hashtable;

hashtable_t *ht_create( int size );

int ht_hash( hashtable_t *hashtable, char *key );

entry_t *ht_newpair( char *key, int *value );

void ht_set( hashtable_t *hashtable, char *key, int *value );

int *ht_get( hashtable_t *hashtable, char *key );

#endif