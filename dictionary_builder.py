#!/usr/bin/env python
# -*- coding: utf-8 -*-

import json

import pprint

# Prints the nicely formatted dictionary

Dictionary = {}

notFound = 0
found = 0

with open('text.json') as json_file:
    data = json.load(json_file)
    for p in data['Dictionary']['DictionaryEntry']:
        entry = {
            'definition' : 'Ei löydy vielä...'
        }
        entry['identifier'] = p['_identifier']
        pprint.pprint(p['_identifier'])
        #print (len(p))
        if 'SenseGrp' in p.keys():
            print ('SenseGrp: ','Definition' in p['SenseGrp'][0].keys())
            if 'Definition' in p['SenseGrp'][0].keys():
                print ('Aux: ', 'SeeAlso' in p['SenseGrp'][0]['Definition'])
                #print(p['SenseGrp'][0]['Definition'])
                if ('SeeAlso' in p['SenseGrp'][0]['Definition']):
                    print('SeeAlsoSEEEE ALLLLLSSOOO')
                    entry['definition'] = p['SenseGrp'][0]['Definition']
                    print(len(p['SenseGrp'][0]['Definition']))
                    found = found + 1
            else :
                notFound = notFound + 1
                print('No definition')
        else:
            if 'Definition' in p['HeadwordCtn'].keys():
                print(p['HeadwordCtn']['Definition'])
                found = found + 1
            else :
                notFound= notFound + 1
                print('No definition')
print('Total not fount: ', notFound)
print('Total found: ', found)

        #print('Name: ' + p['HeadwordCtn'])
        #print('Website: ' + p['website'])
        #print('From: ' + p['from'])
        #print('')