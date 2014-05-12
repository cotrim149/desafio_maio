//
//  Pokemon.m
//  desafioRevisao
//
//  Created by ALS on 12/05/14.
//  Copyright (c) 2014 Cotrim. All rights reserved.
//

#import "Pokemon.h"

@implementation Pokemon

-(NSString*) description{
    return [NSString stringWithFormat:@"%@ - %@ - %@ \n",self.number,self.name, self.path];
}

@end
