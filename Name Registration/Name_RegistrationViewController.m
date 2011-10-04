//
//  Name_RegistrationViewController.m
//  Name Registration
//
//  Created by Robério Vitória on 03/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Name_RegistrationViewController.h"
// Importando a classe de Delegate 
#import "Name_RegistrationAppDelegate.h"
// Importando a classe de modelo dos dados
#import "Pessoa.h"
// Importando a classe que vai ser chamada toda vez que o botão de adicionar for clicado
#import "EditNameViewController.h"

@implementation Name_RegistrationViewController

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
    
    // Título da NavigationBar
    self.navigationItem.title = @"Cadastro de Nomes";
    // Cria um botão do lado direito da NavigationBar do tipo Add e que recebe um metodo addName: como sua ação
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addName:)] autorelease];
    // Cria um botão do lado esquerdo da NavigationBar com o título "Editar" e que recebe o metodo editName: como sua ação
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"Editar" style:UIBarButtonItemStyleBordered target:self action:@selector(editName:)] autorelease];
    // Do any additional setup after loading the view from its nib.
}

- (void)addName:(id)sender
{
    // Instancia a classe Name (Modelo de dados)
    Pessoa *novaPessoa = [[Pessoa alloc] init];

    // Instancia a classe NameRegistrationViewController
    EditNameViewController *editNameView = [[EditNameViewController alloc] init];
    
    editNameView.recebePessoa = novaPessoa; 
    
    // Passa nameRegistrationView como parametro para a NavigationController - Tela que vai ser mostrada apartir dela
    [self.navigationController pushViewController:editNameView animated:YES];
    [novaPessoa release];
}

- (void)editName:(id)sender
{
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // Força pra com que a variável esteja sempre em branco quando aparecer a view
    appDelegate.pessoaAtual = nil;
    // Atualiza os dados da tableView
    [tableView reloadData];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section
{
    // Retorna o numero de dados do array para a tableView colocar o número de linhas certo
    return [appDelegate.pessoas count]; 
}

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...   
    // Retorna para p o objeto com a sua linha específica
    Pessoa *p = [appDelegate.pessoas objectAtIndex:[indexPath row]];
    // Imprime na célula o nome da pessoaAtual
    cell.textLabel.text = p.nome;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

@end