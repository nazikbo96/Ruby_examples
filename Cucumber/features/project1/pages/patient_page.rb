require_relative 'top_part.rb'
class PatientPage

  include TopPart

  def delete_patient_btn
    driver.find_element(id: 'org.openmrs.module.coreapps.deletePatient')
  end

  def delete_reason_field
    driver.find_element(id: 'delete-reason')
  end

  def patient_dialog
    driver.find_element(css: '#delete-patient-creation-dialog')
  end

  def confirm_delete_btn
    patient_dialog.find_element(css: '.confirm.right')
  end

  def delete_patient_btn_click
    delete_patient_btn.click
  end

  def delete_reason_field_input(reason)
    delete_reason_field.send_keys reason
  end

  def confirm_delete_btn_click
    confirm_delete_btn.click
    FindPatientPage.new
  end

end
