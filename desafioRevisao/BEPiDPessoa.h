//
//  BEPiDPessoa.h
//  Aula
//
//  Created by Phelippe Augusto de Amorim on 3/14/14.
//  Copyright (c) 2014 Phelippe Augusto de Amorim. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(char, BEPiDSexo)
{
    Masculino = 'm',
    Feminino = 'f'
};

@interface BEPiDPessoa : NSObject

@property (nonatomic) NSDate *dataNascimento;
@property NSString *nome;
@property NSString *sobreNome;
@property BEPiDSexo sexo;

- (NSString *)nomeCompleto;
- (long)idade;

@end




