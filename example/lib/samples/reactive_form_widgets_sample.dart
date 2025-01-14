import 'package:flutter/material.dart' hide ProgressIndicator;
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms_example/sample_screen.dart';
import 'package:reactive_segmented_control/reactive_segmented_control.dart';
import 'package:reactive_touch_spin/reactive_touch_spin.dart';

class ReactiveFormWidgetsSample extends StatelessWidget {
  FormGroup buildForm() => fb.group(<String, Object>{
        'menu': FormControl<String>(value: 'Tunisia'),
        'bottomSheet': FormControl<String>(value: 'Brazil'),
        'touchSpin': FormControl<double>(value: 10),
        'rate': FormControl<String>(value: 'a'),
        'date': FormControl<DateTime>(value: DateTime.now()),
        'time': FormControl<DateTime>(value: DateTime.now()),
        'dateTime': FormControl<DateTime>(value: DateTime.now()),
      });

  @override
  Widget build(BuildContext context) {
    return SampleScreen(
      title: const Text('Reactive form widgets sample'),
      body: ReactiveFormBuilder(
        form: buildForm,
        builder: (context, form, child) {
          return Column(
            children: [
              ReactiveDropdownSearch<String, String>(
                formControlName: 'menu',
                decoration: const InputDecoration(
                  labelText: 'Menu mode *',
                  hintText: 'Select a country',
                  helperText: '',
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                  border: OutlineInputBorder(),
                ),
                popupProps: PopupProps.menu(
                  disabledItemFn: (String s) => s.startsWith('I'),
                ),
                items: ['Brazil', 'Italia (Disabled)', 'Tunisia', 'Canada'],
                showClearButton: true,
              ),
              const SizedBox(height: 8),
              ReactiveDropdownSearch<String, String>(
                formControlName: 'bottomSheet',
                popupProps: PopupProps.bottomSheet(
                  disabledItemFn: (String s) => s.startsWith('I'),
                  title: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Country',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  showSearchBox: true,
                  bottomSheetProps: BottomSheetProps(
                    constraints: const BoxConstraints(maxHeight: 300),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                  ),
                ),
                decoration: const InputDecoration(
                  labelText: 'Custom BottomSheet mode',
                  helperText: '',
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                  border: OutlineInputBorder(),
                ),
                items: ['Brazil', 'Italia', 'Tunisia', 'Canada'],
              ),
              const SizedBox(height: 8),
              ReactiveTouchSpin<double>(
                formControlName: 'touchSpin',
                min: 5,
                max: 100,
                step: 5,
                textStyle: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                  labelText: 'Search amount',
                  helperText: '',
                ),
              ),
              const SizedBox(height: 8),
              ReactiveSegmentedControl(
                decoration: const InputDecoration(
                  labelText: 'Rating',
                  border: OutlineInputBorder(),
                  helperText: '',
                ),
                padding: const EdgeInsets.all(0),
                formControlName: 'rate',
                children: {
                  'a': const Text('A'),
                  'b': const Text('B'),
                  'c': const Text('C'),
                },
              ),
              const SizedBox(height: 8),
              ReactiveDateTimePicker(
                formControlName: 'date',
                decoration: const InputDecoration(
                  labelText: 'Date',
                  border: OutlineInputBorder(),
                  helperText: '',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
              ),
              const SizedBox(height: 8),
              ReactiveDateTimePicker(
                formControlName: 'time',
                type: ReactiveDatePickerFieldType.time,
                decoration: const InputDecoration(
                  labelText: 'Time',
                  border: OutlineInputBorder(),
                  helperText: '',
                  suffixIcon: Icon(Icons.watch_later_outlined),
                ),
              ),
              const SizedBox(height: 8),
              ReactiveDateTimePicker(
                formControlName: 'dateTime',
                type: ReactiveDatePickerFieldType.dateTime,
                decoration: const InputDecoration(
                  labelText: 'Date & Time',
                  border: OutlineInputBorder(),
                  helperText: '',
                  suffixIcon: Icon(Icons.calendar_today),
                ),
              ),
              const SizedBox(height: 16),
              // ElevatedButton(
              //   child: Text('Sign Up'),
              //   onPressed: () {
              //     if (form.valid) {
              //       print(form.value);
              //     } else {
              //       form.markAllAsTouched();
              //     }
              //   },
              // ),
            ],
          );
        },
      ),
    );
  }
}
