//
//  BEPiDPessoa.m
//  Aula
//
//  Created by Phelippe Augusto de Amorim on 3/14/14.
//  Copyright (c) 2014 Phelippe Augusto de Amorim. All rights reserved.
//

#import "BEPiDPessoa.h"

@implementation BEPiDPessoa

- (NSString *)nomeCompleto{
    return [NSString stringWithFormat:@"%@ %@",self.nome, self.sobreNome];
}


- (long)idade{

    NSCalendar *gregoriano = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *now = [NSDate date];
    unsigned int unityFlags = NSMonthCalendarUnit | NSDayCalendarUnit;
    
    NSDateComponents *idade = [gregoriano components:unityFlags fromDate:now toDate: self.dataNascimento options:0];
    
    return [idade month]/12 * (-1);
}

-(NSString*)description{
    
    return [NSString stringWithFormat:@" Nome Completo: %@  \n Data Nascimento: %@ \n Idade: %ld \n Sexo: %c\n",[self nomeCompleto],self.dataNascimento,[self idade],self.sexo];
}

@end