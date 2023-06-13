import { PartialType } from '@nestjs/mapped-types';
import { CreateSubMenuDto } from './create-sub-menu.dto';

export class UpdateSubMenuDto extends PartialType(CreateSubMenuDto) {}
