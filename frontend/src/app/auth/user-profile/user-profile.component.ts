import { Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { AuthService } from './../../shared/auth.service';
// User interface
export class User {
  name: any;
  email: any;
  id:any;
  rol:any;
  telefono:any;
  direccion:any;
}
@Component({
  selector: 'app-user-profile',
  templateUrl: './user-profile.component.html',
  styleUrls: ['./user-profile.component.scss'],
})
export class UserProfileComponent implements OnInit {
  UserProfile!: User;
  aux!: boolean;
  esAdmin!:boolean;
  constructor(public authService: AuthService, private router: Router) {
    this.authService.profileUser().subscribe((data: any) => {
      this.UserProfile = data;
      sessionStorage.setItem('rol', this.UserProfile.rol);
    });
  }
  ngOnInit() {
    if (sessionStorage.getItem('rol')=="admin") {
      this.esAdmin=true;
    }
    if(sessionStorage.getItem('rol')=='' || sessionStorage.getItem('rol')==undefined || sessionStorage.getItem('rol')==null){
      this.router.navigateByUrl('/login');
    }
  }

  estaLogeado(){
    if(sessionStorage.getItem('rol') == ''){
      this.aux=false;
    }
    else{
      this.aux=true;
    }
  }

  refresh(): void { window.location.reload(); }
}
