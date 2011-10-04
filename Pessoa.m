//
//  Name.m
//  Name Registration
//
//  Created by Robério Vitória on 03/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Pessoa.h"

@implementation Pessoa

// Necessário para que o compilador possa criar os métodos getter e setter corretamente de nome
@synthesize nome;

// Utilizado para codificar o receptor para um objeto
- (void)encodeWithCoder:(NSCoder *)encoder 
{
	[encoder encodeObject:nome forKey:@"Nome"];
}

// Retorna um objeto apartir de dados desarquivados
- (id)initWithCoder:(NSCoder *)decoder 
{
	self = [super init];
	
	self.nome = [decoder decodeObjectForKey:@"Nome"];
	
	return self;
}

@end
