//
//  main.m
//  desafioRevisao
//
//  Created by ALS on 08/05/14.
//  Copyright (c) 2014 Cotrim. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "BEPiDPessoa.h"
#import "Pokemon.h"

NSString* criaDiretorio(NSString *numProjeto){
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *erro;
    
    NSArray *desktops = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
    NSMutableString *dir = [[NSMutableString alloc] init];
    [dir appendString:[desktops objectAtIndex:0]];
    [dir appendString:@"/Ambiente/"];
    [dir appendString:numProjeto];
    
    NSLog(@"%@",dir);
    if(![fileManager fileExistsAtPath:dir]){
        if (![fileManager createDirectoryAtPath:dir withIntermediateDirectories:YES attributes:nil error:&erro]) {
            NSLog(@"%@",[erro localizedDescription]);
        }else{
            NSLog(@"Pasta criada com sucesso");
        }
    }
    
    return dir;
}

NSString* questao_1_1(){
    
    NSArray *desktops = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
    NSMutableString *path = [[NSMutableString alloc] init];
    [path appendString:[desktops objectAtIndex:0]];
    [path appendString:@"/Ambiente/"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSDirectoryEnumerator *dirEnum = [fileManager enumeratorAtPath:path];
    

    NSString *file;
    int cont=0;
    while (file = [dirEnum nextObject]) {
        
        if([[file pathExtension] isEqualToString:@""]){
            NSArray *folders =[file pathComponents];
            NSString *folder = [folders objectAtIndex: [folders count]-1];
            
            if([folder isNotEqualTo:@".DS_Store"]){
                
                cont++;
                
            }
            
        }
    }
    return [NSString stringWithFormat:@"%d Pastas",cont];
}

NSString* questao_1_2(){

    NSArray *desktops = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
    NSMutableString *path = [[NSMutableString alloc] init];
    [path appendString:[desktops objectAtIndex:0]];
    [path appendString:@"/Ambiente/"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSDirectoryEnumerator *dirEnum = [fileManager enumeratorAtPath:path];
    
    
    NSString *file;
    int cont=0;
    while (file = [dirEnum nextObject]) {
        
        
        
        if([[file pathExtension] isNotEqualTo:@""] ){
            
            cont++;
        }
        
    }
    return [NSString stringWithFormat:@"%d Arquivos",cont];
}

NSString* questao_1_3(){
    NSArray *desktops = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
    NSMutableString *path = [[NSMutableString alloc] init];
    [path appendString:[desktops objectAtIndex:0]];
    [path appendString:@"/Ambiente/"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSDirectoryEnumerator *dirEnum = [fileManager enumeratorAtPath:path];
    
    
    NSString *file;
    NSMutableArray *extensions = [[NSMutableArray alloc] init];
    
    while (file = [dirEnum nextObject]) {
        
        if([[file pathExtension] isNotEqualTo:@""] ){
            
            if([extensions count] < 1){
                [extensions addObject:[file pathExtension]];
            }else {
                if(![extensions containsObject:[file pathExtension]]){
                    [extensions addObject:[file pathExtension]];
                }
            }
            
        }
    }

    return [NSString stringWithFormat:@"%lu tipos diferentes de arquivos",[extensions count]];
}

NSMutableArray *getExtensions(){
    NSArray *desktops = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
    NSMutableString *path = [[NSMutableString alloc] init];
    [path appendString:[desktops objectAtIndex:0]];
    [path appendString:@"/Ambiente/"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSDirectoryEnumerator *dirEnum = [fileManager enumeratorAtPath:path];
    
    
    NSString *file;
    NSMutableArray *extensions = [[NSMutableArray alloc] init];
    
    while (file = [dirEnum nextObject]) {
        
        if([[file pathExtension] isNotEqualTo:@""] ){
            
            if([extensions count] < 1){
                [extensions addObject:[file pathExtension]];
            }else {
                if(![extensions containsObject:[file pathExtension]]){
                    [extensions addObject:[file pathExtension]];
                }
            }
            
        }
    }
    
    return extensions;
}

NSString* questao_1_4(){
    
    NSMutableArray *extensions = getExtensions();
    
    NSMutableString *strExtensions = [[NSMutableString alloc] init];
    
    
    for (int i=0; i < [extensions count]; i++) {
        [strExtensions appendString:[extensions objectAtIndex:i]];
        if (i == [extensions count]-1) {
            [strExtensions appendString:@"."];
        }else
            [strExtensions appendString:@","];
    }
    
    return strExtensions;
}

NSString* questao_1_5(){
    
    NSMutableArray *extensions = getExtensions();
    
    NSArray *desktops = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
    NSMutableString *path = [[NSMutableString alloc] init];
    [path appendString:[desktops objectAtIndex:0]];
    [path appendString:@"/Ambiente/"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSDirectoryEnumerator *dirEnum = [fileManager enumeratorAtPath:path];
    
    
    NSString *file;
    
    NSMutableDictionary *arquivos = [[NSMutableDictionary alloc] init];
    
    for (int i=0; i < [extensions count]; i++) {
        [arquivos setValue:[NSNumber numberWithInt:0] forKey:[extensions objectAtIndex:i]];
    }
    
    while (file = [dirEnum nextObject]){
    
        int valor = [[arquivos valueForKey:[file pathExtension]] intValue];
        valor++;
        [arquivos setValue:[NSNumber numberWithInt:valor] forKey:[file pathExtension]];
    }

    [arquivos removeObjectForKey:@""];
    
    NSMutableString *strArquivos = [[NSMutableString alloc] init];
    for(NSString* dic in arquivos){
        int value = [[arquivos valueForKey:dic] intValue] ;
        [strArquivos appendString:dic];
        [strArquivos appendString: [[NSString alloc] initWithFormat:@" %d",value] ];
        [strArquivos appendString:@","];
    }
    
    
    return strArquivos;

}

NSString* questao_1_6(){
    NSMutableArray *extensions = getExtensions();
    
    NSArray *desktops = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
    NSMutableString *path = [[NSMutableString alloc] init];
    [path appendString:[desktops objectAtIndex:0]];
    [path appendString:@"/Ambiente/"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSDirectoryEnumerator *dirEnum = [fileManager enumeratorAtPath:path];
    
    
    NSString *file;
    
    NSMutableDictionary *arquivos = [[NSMutableDictionary alloc] init];
    
    for (int i=0; i < [extensions count]; i++) {
        [arquivos setValue:[NSNumber numberWithInt:0] forKey:[extensions objectAtIndex:i]];
    }
    NSError *error;
    while (file = [dirEnum nextObject]){
        NSMutableString *pathFile = [NSMutableString stringWithString:path];
        [pathFile appendString:file];
        
        int valor = [[arquivos valueForKey:[file pathExtension]] intValue];
        NSDictionary *arquivo = [fileManager attributesOfItemAtPath:pathFile error:&error];
        int fileSize = [[arquivo valueForKey:NSFileSize] intValue];
        
        valor+= fileSize;
        [arquivos setValue:[NSNumber numberWithInt:valor] forKey:[file pathExtension]];
    }

    [arquivos removeObjectForKey:@""];

    NSMutableString *strArquivos = [[NSMutableString alloc] init];
    for(NSString* dic in arquivos){
        int value = [[arquivos valueForKey:dic] intValue] ;
        [strArquivos appendString:dic];
        [strArquivos appendString: [[NSString alloc] initWithFormat:@" %d",value] ];
        [strArquivos appendString:@","];
    }
    
    return strArquivos;
    
}

NSString* questao_1_7(){
    NSMutableArray *extensions = getExtensions();
    
    NSArray *desktops = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
    NSMutableString *path = [[NSMutableString alloc] init];
    [path appendString:[desktops objectAtIndex:0]];
    [path appendString:@"/Ambiente/"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSDirectoryEnumerator *dirEnum = [fileManager enumeratorAtPath:path];
    
    
    NSString *file;
    
    NSMutableDictionary *arquivos = [[NSMutableDictionary alloc] init];
    
    for (int i=0; i < [extensions count]; i++) {
        [arquivos setValue:[NSNumber numberWithLong:NSIntegerMax] forKey:[extensions objectAtIndex:i]];
    }
    NSError *error;
    while (file = [dirEnum nextObject]){
        NSMutableString *pathFile = [NSMutableString stringWithString:path];
        [pathFile appendString:file];
        
        long valor = [[arquivos valueForKey:[file pathExtension]] longValue];
        NSDictionary *arquivo = [fileManager attributesOfItemAtPath:pathFile error:&error];
        int fileSize = [[arquivo valueForKey:NSFileSize] intValue];
        
        if(fileSize < valor){
            [arquivos setValue:[NSNumber numberWithInt:fileSize] forKey:[file pathExtension]];
            
        }

    }

    [arquivos removeObjectForKey:@""];
    
    NSMutableString *strArquivos = [[NSMutableString alloc] init];
    for(NSString* dic in arquivos){
        int value = [[arquivos valueForKey:dic] intValue] ;
        [strArquivos appendString:dic];
        [strArquivos appendString: [[NSString alloc] initWithFormat:@" %d",value] ];
        [strArquivos appendString:@","];
    }

    return strArquivos;
}

NSString* questao_1_8(){
    NSMutableArray *extensions = getExtensions();
    
    NSArray *desktops = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
    NSMutableString *path = [[NSMutableString alloc] init];
    [path appendString:[desktops objectAtIndex:0]];
    [path appendString:@"/Ambiente/"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSDirectoryEnumerator *dirEnum = [fileManager enumeratorAtPath:path];
    
    
    NSString *file;
    
    NSMutableDictionary *arquivos = [[NSMutableDictionary alloc] init];
    
    for (int i=0; i < [extensions count]; i++) {
        [arquivos setValue:[NSNumber numberWithInt:0] forKey:[extensions objectAtIndex:i]];
    }
    NSError *error;
    while (file = [dirEnum nextObject]){
        NSMutableString *pathFile = [NSMutableString stringWithString:path];
        [pathFile appendString:file];
        
        int valor = [[arquivos valueForKey:[file pathExtension]] intValue];
        NSDictionary *arquivo = [fileManager attributesOfItemAtPath:pathFile error:&error];
        int fileSize = [[arquivo valueForKey:NSFileSize] intValue];
        
        if(fileSize > valor){
            [arquivos setValue:[NSNumber numberWithInt:fileSize] forKey:[file pathExtension]];
            
        }
        
    }
    
    [arquivos removeObjectForKey:@""];
    
    NSMutableString *strArquivos = [[NSMutableString alloc] init];
    for(NSString* dic in arquivos){
        int value = [[arquivos valueForKey:dic] intValue] ;
        [strArquivos appendString:dic];
        [strArquivos appendString: [[NSString alloc] initWithFormat:@" %d",value] ];
        [strArquivos appendString:@","];
    }
    
    return strArquivos;

    
}

NSMutableString* last4Numbers(int size, NSString *item){

    NSMutableString *last4NumbersItem = [[NSMutableString alloc] init];
    
    for(int i=size; i>(size - 4) ; i--){
        [last4NumbersItem appendFormat:@"%c",[item characterAtIndex:i-1]];
        
    }
    
    return last4NumbersItem;
}

NSString* questao_1_9(){

    NSArray *desktops = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
    NSMutableString *path = [[NSMutableString alloc] init];
    [path appendString:[desktops objectAtIndex:0]];
    [path appendString:@"/Ambiente/segredo.txt"];
    
    NSError *error;
    NSString *segredos = [[NSString alloc]
                          initWithContentsOfFile:path
                          encoding:NSUTF8StringEncoding
                          error:&error];
    
    NSMutableArray *telefones = [[NSMutableArray alloc] init];
    NSError *regexError;
    
    NSString *regexTelefone1 = @"[(]\\d{2}[)]\\d{4}-\\d{4}";
    NSString *regexTelefone2 = @"\\d{4}-\\d{4}";
    NSString *regexTelefone3 = @"\\d{8}";
    NSString *regexTelefone4 = @"\\d{2}[(]\\d{2}[)]\\d{8}";

    NSArray *regexTelefones = [[NSArray alloc] initWithObjects:regexTelefone1,regexTelefone2,regexTelefone3,regexTelefone4, nil];

    for(int i=0; i< [regexTelefones count]; i++){
        
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:[regexTelefones objectAtIndex:i] options:NSRegularExpressionCaseInsensitive error:&regexError];
        
        NSArray *result = [regex matchesInString:segredos options:0 range:NSMakeRange(0, [segredos length])];
        
        NSRange matchRange;

        for(NSTextCheckingResult *match in result){
            
            matchRange = [match range];
            NSMutableString *fone = [[NSMutableString alloc] init];
            [fone appendString:[segredos substringWithRange:matchRange]];
            [telefones addObject:fone];
        }
        
    }

    NSMutableArray *telefonesFinais = [[NSMutableArray alloc] init];
    
    for (int i=0; i< [telefones count]; i++) {
        NSString *item = [telefones objectAtIndex:i];
        
        NSMutableString *last4NumbersItem = last4Numbers([item length], item);

        if(i+1 < [telefones count]){
            
            for(int j=i+1; j<[telefones count]; j++){
                NSString *telefoneAtual = [telefones objectAtIndex:j];
                NSMutableString *last4NumbersAtual = last4Numbers([telefoneAtual length], telefoneAtual);
            
                if([last4NumbersItem isEqualToString:last4NumbersAtual]){
                    
                    if([item length] <= [telefoneAtual length]){
                        [telefonesFinais addObject:item];
                    }else{
                        [telefonesFinais addObject:telefoneAtual];
                    }
                }
            }
        }
    }
    
    for(int i=0;i < [telefonesFinais count]; i++){
        [telefones removeObject:[telefonesFinais objectAtIndex:i]];
    }

    NSMutableString *strTelefones = [[NSMutableString alloc] init];
    
    for(int i =0; i< [telefones count]; i++){
        [strTelefones appendString: [telefones objectAtIndex:i]];
        if(i == [telefones count]-1)
            [strTelefones appendString:@"."];
        else{
            [strTelefones appendString:@", "];
        }
    }
    
    return strTelefones;
    
}

NSString* questao_2_1(){

    NSArray *desktops = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
    NSMutableString *path = [[NSMutableString alloc] init];
    [path appendString:[desktops objectAtIndex:0]];
    [path appendString:@"/Ambiente/"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSDirectoryEnumerator *dirEnum = [fileManager enumeratorAtPath:path];
    
    
    NSString *file;
    NSMutableString* pathOfFile = [NSMutableString stringWithString:path];
    while (file = [dirEnum nextObject]) {
        NSArray* dir = [file pathComponents];
        
        NSString* fileInDir = [dir objectAtIndex:[dir count]-1];
        
        if([fileInDir isEqualToString:@"BEPiDPessoa.h"]){
            [pathOfFile appendString:file];
            
        }
        
    }

    return pathOfFile;
}

NSString* questao_2_2(){
    
    NSArray *desktops = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
    NSMutableString *path = [[NSMutableString alloc] init];
    [path appendString:[desktops objectAtIndex:0]];
    [path appendString:@"/Ambiente/"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSDirectoryEnumerator *dirEnum = [fileManager enumeratorAtPath:path];
    
    
    NSString *file;
    NSMutableString* pathOfFile = [NSMutableString stringWithString:path];
    while (file = [dirEnum nextObject]) {
        NSArray* dir = [file pathComponents];
        
        NSString* fileInDir = [dir objectAtIndex:[dir count]-1];
        
        if([fileInDir isEqualToString:@"BEPiDPessoa.m"]){
            [pathOfFile appendString:file];
            
        }
        
    }
    
    return pathOfFile;
}

BEPiDSexo mapSexo(NSString *sexo){
    if([sexo isEqualToString:@"M"]){
        return Masculino;
    }else
        return Feminino;
}

NSDate* initDate(NSString *date){
    
    
    NSArray *infoDate = [date componentsSeparatedByString:@"/"];
    
    int day = [[infoDate objectAtIndex:0] intValue];
    int month = [[infoDate objectAtIndex:1] intValue];
    int year = [[infoDate objectAtIndex:2] intValue];
    
    NSDateComponents *dtNascimento = [[NSDateComponents alloc] init];
    [dtNascimento setDay:day];
    [dtNascimento setMonth:month];
    [dtNascimento setYear:year];
    
    NSCalendar *gregoriano = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDate* dtNascimentoFinal = [gregoriano dateFromComponents:dtNascimento];
    
    return dtNascimentoFinal;
}

NSString* questao_2_3(){
    
    NSArray *desktops = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
    NSMutableString *path = [[NSMutableString alloc] init];
    [path appendString:[desktops objectAtIndex:0]];
    [path appendString:@"/Ambiente/"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSDirectoryEnumerator *dirEnum = [fileManager enumeratorAtPath:path];
    
    
    NSString *file;
    NSMutableArray* csvFiles = [[NSMutableArray alloc] init];
    
    while (file = [dirEnum nextObject]) {
        
        if([[file pathExtension] isEqualToString:@"csv"]){
            NSMutableString* pathOfFile = [NSMutableString stringWithString:path];
        
            [pathOfFile appendString:file];
            
            NSError *error;
            NSString* csvFile = [[NSString alloc] initWithContentsOfFile:pathOfFile encoding:NSUTF8StringEncoding error:&error];
            if(error == NULL){
                [csvFiles addObject:csvFile];
            } else{
                NSLog(@"%@",[error localizedDescription]);
                NSLog(@"%@",pathOfFile);
            }
            
        }
        
    }
    
    NSMutableArray *csvValidos = [[NSMutableArray alloc] init];
    for(int i=0; i < [csvFiles count]; i++){
        NSArray *str = [[csvFiles objectAtIndex:i] componentsSeparatedByString:@"\n"];
        NSArray *atributos = [[str objectAtIndex:0] componentsSeparatedByString:@","];
        
        if([atributos count] == 4){
            [csvValidos addObject:[csvFiles objectAtIndex:i]];
        }
        
    }
    
    NSMutableArray *infoPessoas = [[NSMutableArray alloc] init];
    for (int i=0; i < [csvValidos count]; i++) {
        NSArray *info = [[csvValidos objectAtIndex:i] componentsSeparatedByString:@"\n"];
        
        for (int j=1; j< [info count]; j++) {
            [infoPessoas addObject:[info objectAtIndex:j]];
        }
    }
    
    

    
    NSMutableArray *pessoas = [[NSMutableArray alloc] init];
    
    for(int i=1;i<[infoPessoas count]; i++){
        BEPiDPessoa *pessoa = [[BEPiDPessoa alloc] init];
        
        NSArray *infos = [[infoPessoas objectAtIndex:i] componentsSeparatedByString:@","];
    
        pessoa.nome = [infos objectAtIndex:0];
        pessoa.sobreNome = [infos objectAtIndex:1];
        pessoa.dataNascimento = initDate([infos objectAtIndex:2]);
        pessoa.sexo = mapSexo([infos objectAtIndex:3]);
        
        [pessoas addObject:pessoa];
    }

    //Filtragem
    NSMutableArray *mulheres = [[NSMutableArray alloc] init];
    
    for(int i=0; i< [pessoas count]; i++){
        BEPiDPessoa *pessoa = [pessoas objectAtIndex:i];
        if(pessoa.sexo == Feminino){
            [mulheres addObject:[pessoas objectAtIndex:i]];
        }
    }
    
    NSMutableArray *mulheresMaiores = [[NSMutableArray alloc] init];
    
    for (int i=0; i < [mulheres count]; i++) {
        BEPiDPessoa *pessoa = [mulheres objectAtIndex:i];
        
        if([pessoa idade] > 18){
            [mulheresMaiores addObject: [mulheres objectAtIndex:i]];
        }
    }
    
    
    NSMutableArray *sobrenomeS = [[NSMutableArray  alloc] init];
    
    for (int i=0; i <  [mulheresMaiores count]; i++) {
        BEPiDPessoa *pessoa = [mulheresMaiores objectAtIndex:i];
        
        if([pessoa.sobreNome characterAtIndex:0] == 'S'){
            [sobrenomeS addObject:[mulheresMaiores objectAtIndex:i]];
        }
    }
    
    
    NSSortDescriptor *sobreNome = [NSSortDescriptor sortDescriptorWithKey:@"sobreNome" ascending:YES];
    
    [sobrenomeS sortUsingDescriptors:@[sobreNome]];
        
    NSMutableString *str = [[NSMutableString alloc] init];
    
    for(int i=0; i< [sobrenomeS count];i++){
        BEPiDPessoa *pessoa = [sobrenomeS objectAtIndex:i];
        
        [str appendString:[NSString stringWithFormat:@"%@",pessoa]];
        
    }
    
    return str;
}

NSString *questao_3(NSString* dir){
    
    NSMutableString *dirBdPokemon = [NSMutableString stringWithString:dir];
    [dirBdPokemon appendString:@"/bd_pokemon_151.csv"];
    
    NSError *erro;
    
    NSString *bdPokemon = [[NSString alloc] initWithContentsOfFile:dirBdPokemon encoding:NSUTF8StringEncoding error:&erro];
    NSArray *arrayBdPokemon = [bdPokemon componentsSeparatedByString:@"\n"];
    
    //NSLog(@"%@",[arrayBdPokemon objectAtIndex:0]);
    
    NSMutableArray *pokemons = [[NSMutableArray alloc] init];
    
    for(int i=0; i< [arrayBdPokemon count]; i++){
        
        NSArray* arr = [[arrayBdPokemon objectAtIndex:i] componentsSeparatedByString:@","];
        [pokemons addObject:arr];
    }

    if(erro != NULL){
        NSLog(@"%@",[erro localizedDescription]);
    }
    
    NSArray *desktops = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
    NSMutableString *path = [[NSMutableString alloc] init];
    [path appendString:[desktops objectAtIndex:0]];
    [path appendString:@"/Ambiente/"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSDirectoryEnumerator *dirEnum = [fileManager enumeratorAtPath:path];
    
    
    NSString *file;
    
    NSMutableArray *pokedex = [[NSMutableArray alloc] init];
    int cont=0;
    while (file = [dirEnum nextObject]) {
        NSArray* dir = [file pathComponents];
        
        NSString* pokemonNameWithExtension = [dir objectAtIndex:[dir count]-1];
        
        if ([[file pathExtension] isEqualToString:@"png"]) {
            NSMutableString *pathOfPokemon = [[NSMutableString alloc] init];
            [pathOfPokemon appendString:path];
            [pathOfPokemon appendString:file];
            
            
            NSArray *pokemonNameComponents = [pokemonNameWithExtension componentsSeparatedByString:@"."];
            NSString *pokemonName = [pokemonNameComponents objectAtIndex:0];
            
            
            for (int i=0; i < [pokemons count]; i++) {
                NSString *numberInArray = [[pokemons objectAtIndex:i] objectAtIndex:0];
                NSString *nameInArray = [[pokemons objectAtIndex:i] objectAtIndex:1];
                
                
                if([pokemonName isEqualToString:nameInArray]){
                    Pokemon *pokemon = [[Pokemon alloc] init];
                    pokemon.number = numberInArray;
                    pokemon.name = pokemonName;
                    pokemon.path = pathOfPokemon;
                    [pokedex addObject:pokemon];
                    cont++;
                }
                    
                
                
            }
            
        }
    }

    NSSortDescriptor *number = [NSSortDescriptor sortDescriptorWithKey:@"number" ascending:YES];

    [pokedex sortUsingDescriptors:@[number]];

    NSMutableString *strPokedex = [[NSMutableString alloc] init];
    
    for (int i=0; i < [pokedex count]; i++) {
        [strPokedex appendString:[[pokedex objectAtIndex:i] description]];
    }
    
    return strPokedex;
}

int main(int argc, char *argv[]){
    @autoreleasepool {
        NSString* dir = criaDiretorio(@"91");
        
        NSString* q1 = questao_1_1();
        NSString* q2 = questao_1_2();
        NSString* q3 = questao_1_3();
        NSString* q4 = questao_1_4();
        NSString* q5 = questao_1_5();
        NSString* q6 = questao_1_6();
        NSString* q7 = questao_1_7();
        NSString* q8 = questao_1_8();
        NSString* q9 = questao_1_9();
        
        NSString *questoes = [NSString stringWithFormat:@" 1 - %@ \n 2 - %@ \n 3 - %@ \n 4 - %@ \n 5 - %@ \n 6 - %@ \n 7 - %@ \n 8 - %@ \n 9 - %@ \n",q1,q2,q3,q4,q5,q6,q7,q8,q9];
        
        NSMutableString *pathOfFile = [NSMutableString stringWithString:dir];
        [pathOfFile appendString:@"/respostas_desafio_1.txt"];
        [questoes writeToFile:pathOfFile atomically:YES encoding:NSUTF8StringEncoding error:NULL];
        
        
        NSString* q2_1 = questao_2_1();
        NSString* q2_2 = questao_2_2();
        NSString* q2_3 = questao_2_3();
        
        NSString *questao_2 = [NSString stringWithFormat:@" 1 - %@ \n 2 - %@ \n 3 - %@ \n",q2_1,q2_2,q2_3];
        
        NSMutableString *pathOfFile2 = [NSMutableString stringWithString:dir];
        [pathOfFile2 appendString:@"/respostas_desafio_2.txt"];
        
        [questao_2 writeToFile:pathOfFile2 atomically:YES encoding:NSUTF8StringEncoding error:NULL];
        
        
        NSString* q_3 = questao_3(dir);
        NSMutableString *pathOfFile3 = [NSMutableString stringWithString:dir];
        [pathOfFile3 appendString:@"/respostas_desafio_3.txt"];
        
        [q_3 writeToFile:pathOfFile3 atomically:YES encoding:NSUTF8StringEncoding error:NULL];
        
    }
    
    return 0;
}
