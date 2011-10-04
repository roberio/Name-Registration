//
//  EditNameViewController.m
//  Name Registration
//
//  Created by Robério Vitória on 03/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EditNameViewController.h"
#import "Name_RegistrationAppDelegate.h"
#import "Pessoa.h"

@implementation EditNameViewController

// Necessário para que o compilador possa criar os métodos getter e setter corretamente de recebePessoa
@synthesize recebePessoa;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    appDelegate = [[UIApplication sharedApplication] delegate];
    // Atribou o título na NavigationBar
    self.navigationItem.title = @"Editando";
    // Cria um botão do lado direito da NavigationBar com o título "Salvar" e que recebe o metodo doneAction: como sua ação
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Salvar" style:UIBarButtonItemStyleDone target:self action:@selector(doneAction:)] autorelease];
    // Cria um botão do lado esquerdo da NavigationBar com o título "Cancelar" e que recebe o metodo cancelAction: como sua ação
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Cancelar" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelAction:)] autorelease];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated 
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated 
{
	[super viewDidAppear:animated];
    // Faz com que o foco já apareça no textField quando for mostrado a view
	[textField becomeFirstResponder];
}

#pragma mark - TextField delegate

- (void)doneAction:(id)sender {
    // Passa para a variável o valor do textField
    recebePessoa.nome = textField.text;
    // Adiciona no array o objeto
    [appDelegate.pessoas addObject:recebePessoa];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)cancelAction:(id)sender {
    // Retorna para a view anterior
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end