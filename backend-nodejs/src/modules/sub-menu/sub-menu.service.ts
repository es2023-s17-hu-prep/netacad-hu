import { Injectable, Logger } from '@nestjs/common';
import { CreateSubMenuDto } from './dto/create-sub-menu.dto';
import { UpdateSubMenuDto } from './dto/update-sub-menu.dto';
import { PrismaService } from '../../libs/prisma/prisma.service';
import { SubMenu } from './entities/sub-menu.entity';

@Injectable()
export class SubMenuService {
  private readonly logger = new Logger(SubMenuService.name);
  constructor(private readonly prismaService: PrismaService) {}

  create(createSubMenuDto: CreateSubMenuDto) {
    this.logger.log('Create submenu item')
    return this.prismaService.subMenuItem.create({data: createSubMenuDto});
  }

  findAll(): Promise<SubMenu[]> {
    return this.prismaService.subMenuItem.findMany();
  }

  findOne(id: number): Promise<SubMenu> {
    return this.prismaService.subMenuItem.findUnique({where: {id}});
  }

  update(id: number, updateMenuDto: UpdateSubMenuDto) {
    this.logger.log('Update submenu item')
    return this.prismaService.subMenuItem.update({data: updateMenuDto, where: {id}});
  }

  remove(id: number) {
    this.logger.log('Delete submenu item')
    return this.prismaService.subMenuItem.delete({where: {id}});
  }
}
